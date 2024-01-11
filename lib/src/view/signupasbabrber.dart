import 'package:barberappointmentapp/src/viewmodel/barber_signUp_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:barberappointmentapp/src/view/sign_up_as_customer.dart';
import 'package:provider/provider.dart';

class SignupAsBarber extends StatelessWidget {
  SignupAsBarber({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BarberSignUpViewModel>(context);
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpAsCustomer()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.grey, fontSize: 28),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up as Barber",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.0,
                    ),
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
                onChanged: (value) => viewModel.setName(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),
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
                obscureText: true,
                onChanged: (value) => viewModel.setPassword(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 10),
              child: TextFormField(
                onChanged: (value) => viewModel.setPhonenumber(int.parse(value)),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone Number",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 10),
              child: TextFormField(
                onChanged: (value) => viewModel.setAddress(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Address",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => viewModel.signUp(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(360, 60)),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
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
