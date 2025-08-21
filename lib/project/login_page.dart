import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
  }

  Future<void> login() async {
    final email = namecontroller.text.trim();
    final password = passwordcontroller.text.trim();
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        context.go('/home');
      } else {
        _showErrorDialog('Login failed. Please check your details.');
      }
    } catch (e) {
      _showErrorDialog("Error:$e");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Login Failed",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // void login() {
    //   final username = namecontroller.text;
    //   final userpassword = passwordcontroller.text;
    //   final storage = Hive.box('myBox');
    //   final realuser = storage.get('username');
    //   final realpassword = storage.get('password');
    //   if (realpassword == userpassword && realuser == username) {
    //     context.go('/home');
    //   } else {
    //     showDialog(
    //       context: context,
    //       builder: (_) {
    //         return AlertDialog(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           title: Text(
    //             "Login Failed",
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           content: Text(
    //             "Incorrect ID details. Please try again.",
    //             style: TextStyle(fontSize: 16, color: Colors.black87),
    //           ),
    //           actions: [
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 foregroundColor: Colors.white,
    //                 backgroundColor: Colors.deepPurpleAccent,

    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(8),
    //                 ),
    //               ),
    //               onPressed: () => Navigator.pop(context),
    //               child: Text("OK"),
    //             ),
    //           ],
    //         );
    //       },
    //     );
    //   }
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                  height: 70,
                  width: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ShopEase',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ],
            ),
            SizedBox(height: 130),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Enter Password',
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 310,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(onPressed: () {}, child: Text('Forget Password')),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('DONT HAVE ANY ACCOUNT?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      indent: 30,
                      color: const Color.fromARGB(206, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0), child: Text('OR')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      endIndent: 30,
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Sing up With Social Networks'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://z-m-static.xx.fbcdn.net/rsrc.php/v4/yD/r/5D8s-GsHJlJ.png',
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Google_Plus_icon_%282015-2019%29.svg/1200px-Google_Plus_icon_%282015-2019%29.svg.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://storage.needpix.com/rsynced_images/twitter-2672572_1280.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
