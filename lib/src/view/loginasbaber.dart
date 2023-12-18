import 'package:barberappointmentapp/src/view/signupasbabrber.dart';
import 'package:flutter/material.dart';

class Loginasbabrber extends StatelessWidget {
  Loginasbabrber({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(color: Colors.grey, fontSize: 28),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login as Barber",
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 10),
              child: TextFormField(
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
                    onPressed: () {},
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
              onPressed: () {},
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
                          builder: (context) => SignupAsBarber(),
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