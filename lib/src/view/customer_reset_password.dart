import 'package:flutter/material.dart';

class CustomerResetPassword extends StatelessWidget {
  CustomerResetPassword({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Reset password",
            style:TextStyle(fontSize: 32, fontWeight: FontWeight.bold) 
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
            ),
           
          
            const SizedBox(height: 10,),
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
                "Reset Password",
                style: TextStyle(fontSize: 22),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}