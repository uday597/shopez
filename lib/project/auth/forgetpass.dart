import 'package:flutter/material.dart';
import 'package:shopease/project/account_page.dart';

class ForgetPasword extends StatefulWidget {
  const ForgetPasword({super.key});

  @override
  State<ForgetPasword> createState() => _ForgetPaswordState();
}

class _ForgetPaswordState extends State<ForgetPasword> {
  Future<void> _sendResetEmail() async {
    await supabase.auth.resetPasswordForEmail(
      _emailcontroller.text.trim(),
      redirectTo: 'shopez://reset-password',
    );
  }

  final TextEditingController _emailcontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 106, 76),
              Color.fromARGB(255, 238, 19, 118),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          label: Text('Enter Email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          prefixIcon: Icon(Icons.mail, color: Colors.pink),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _sendResetEmail();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 45),
                          backgroundColor: Colors.pink,
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
