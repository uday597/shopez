import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  Future<void> signup() async {
    final supabase = Supabase.instance.client;
    final email = emailcontroller.text.trim();
    final password = newpasswordcontroller.text.trim();
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
      );
      if (response.user != null) {
        _showDialog('Sign Up Successful!', "Your account has been created");
      }
    } catch (e) {
      _showDialog('Sign Up Failed', e.toString());
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
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

  // void savedata() {
  //   final storage = Hive.box('myBox');
  //   final name = usernamecontroller.text;
  //   final email = emailcontroller.text;
  //   final password = newpasswordcontroller.text;

  //   storage.put('username', name);
  //   storage.put('email', email);
  //   storage.put('password', password);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Enter Name',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  controller: emailcontroller,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Enter Email',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: newpasswordcontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'New Password',
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 310,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //   if (_formkey.currentState!.validate()) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (_) {
                    //       return AlertDialog(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(15),
                    //         ),
                    //         title: Text(
                    //           "Sign Up Successful!",
                    //           style: TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //         content: Text(
                    //           "your account has been created successfully.",
                    //           style: TextStyle(
                    //             fontSize: 16,
                    //             color: Colors.black87,
                    //           ),
                    //         ),
                    //         actions: [
                    //           TextButton(
                    //             style: TextButton.styleFrom(
                    //               foregroundColor: Colors.white,
                    //               backgroundColor: Colors.blue,

                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(8),
                    //               ),
                    //             ),
                    //             onPressed: () {
                    //               savedata();
                    //               Navigator.pop(context);
                    //             },
                    //             child: Text("OK"),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                    if (_formkey.currentState!.validate()) {
                      signup();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: Size(200, 40),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login page',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('OR'),
                  ),
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
      ),
    );
  }
}
