import 'package:flutter/material.dart';
import 'package:barberappointmentapp/src/view/sign_up_as_customer.dart';
import 'package:provider/provider.dart';
import '../controller/customer_reset_password_controller.dart';
import '../viewmodel/customer_login_viewmodel.dart';
import 'customer_reset_password.dart';
import 'loginasbaber.dart';

class LoginAsCustomer extends StatelessWidget {
  LoginAsCustomer({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      // ignore: unused_local_variable
      final viewModel = Provider.of<CustomerLoginViewModel>(context);
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.0,
                    ),
                 
                  ),
                ),
                TextButton(
                  onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginasbabrber()));
},
                  child: const Text(
                    "Login as Barber",
                       style: TextStyle(color: Colors.grey, fontSize: 28),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 10),
              child: TextFormField(
                onChanged: (value) => viewModel.setEmail(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 10),
              child: TextFormField(
                onChanged: (value) => viewModel.setPassword(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: TextButton(
                    onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => CustomerResetPassword(
        controller: CustomerResetPasswordController(),
      ),
    ),
  );
},
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
            onPressed: () => viewModel.loginCustomer(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(360, 60)),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpAsCustomer(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
