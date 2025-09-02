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
    namecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final email = namecontroller.text.trim();
    final password = passwordcontroller.text.trim();
    if (email.isEmpty && password.isEmpty) {
      _showErrorDialog('Login failed. Please enter your details.');
      return;
    }
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
      _showErrorDialog("Error: $e");
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
          title: const Text(
            "Login Failed",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 238, 19, 118),
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
        // 🔥 Gradient background like homepage AppBar
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 50),

                  // White card with inputs
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
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.person, color: Colors.pink),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.pink),
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
                            onPressed: login,
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
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign Up",
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

                  const SizedBox(height: 30),

                  // Social Login Section
                  const Text(
                    "Or sign in with",
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

  // 🔘 Reusable Social Button
  Widget _socialIcon(String url) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: CircleAvatar(radius: 20, backgroundImage: NetworkImage(url)),
    );
  }
}
