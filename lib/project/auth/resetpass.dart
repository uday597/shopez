import 'package:flutter/material.dart';
import 'package:shopease/project/account_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  final TextEditingController _passwordc = TextEditingController();
  @override
  void initState() {
    super.initState();

    print('screen is initilaze 👍👍');
  }

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
                        controller: _passwordc,
                        decoration: InputDecoration(
                          label: Text('New Password'),
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
                          updatepassword(_passwordc.text);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 45),
                          backgroundColor: Colors.pink,
                        ),
                        child: Text(
                          'Reset password',
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

  static updatepassword(String newpassword) {
    supabase.auth.updateUser(UserAttributes(password: newpassword));
  }
}
