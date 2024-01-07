import 'package:flutter/material.dart';
import '../model/customer_model.dart';
import '../view/customer_view_barber_list.dart';

class CustomerLoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> loginCustomer(BuildContext context, List<CustomerModel> customerList) async {
    final authenticatedCustomer = customerList.firstWhere(
      (customer) => customer.email == email && customer.password == password,
      orElse: () => CustomerModel(email: '', password: '', name: '', imagePath: ''),
    );

    if (authenticatedCustomer.email.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  CustomerViewBarberList(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid email or password'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
