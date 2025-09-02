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
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(
                  255,
                  238,
                  19,
                  118,
                ), // same pink
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🔥 Gradient background (same as Login)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 106, 76), // Orange
              Color.fromARGB(255, 238, 19, 118), // Pink
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  // Logo + App Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/applogo.png',
                        height: 70,
                        width: 80,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'ShopEase',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // White card with form fields
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: usernamecontroller,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Name",
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.pink,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.pink,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: newpasswordcontroller,
                            obscureText: true,
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
                              labelText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.pink,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  signup();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  238,
                                  19,
                                  118,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Social Signup
                  const Text(
                    "Or sign up with",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(
                        "https://z-m-static.xx.fbcdn.net/rsrc.php/v4/yD/r/5D8s-GsHJlJ.png",
                      ),
                      const SizedBox(width: 20),
                      _socialIcon(
                        "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                      ),
                      const SizedBox(width: 20),
                      _socialIcon(
                        "https://storage.needpix.com/rsynced_images/twitter-2672572_1280.jpg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔘 Same reusable social button
  Widget _socialIcon(String url) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: CircleAvatar(radius: 20, backgroundImage: NetworkImage(url)),
    );
  }
}
