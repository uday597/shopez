import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  final supabase = Supabase.instance.client;

  Future<void> signInWithGoogle() async {
    const androidClientId =
        '328135893388-9v8imnm4g9a1marn8irf8bbljmc8tqks.apps.googleusercontent.com';
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      Logger().f("1");

      Logger().f(googleSignIn);

      // Initialize Google Sign-In
      await googleSignIn.initialize(serverClientId: androidClientId);

      if (googleSignIn.supportsAuthenticate()) {
        final googleUser = await googleSignIn.authenticate();
        Logger().f("2");

        Logger().f(googleUser);

        // Get auth credentials
        final googleAuth = await googleUser.authentication;

        final idToken = googleAuth.idToken;

        if (idToken == null) {
          throw 'No ID Token found.';
        }

        final response = await Supabase.instance.client.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
        );

        Logger().f("3");

        Logger().f(response);

        final user = response.user;

        Logger().f("4");

        Logger().f(user);
        if (user == null) {
          debugPrint("Supabase login failed: No user found");
          return;
        }

        debugPrint("User logged in successfully: ${user.email}");
      }
    } catch (e) {
      debugPrint("Google Sign-In error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 170,
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                  //

                  // final GoogleSignIn googleSignIn = GoogleSignIn.instance;

                  // googleSignIn.initialize(clientId: AndClientId);

                  // final googleUser = await googleSignIn.authenticate();
                  // final googleAuth = await googleUser.authentication;
                  // final accessToken = googleAuth.idToken;
                  // final idToken = googleAuth.idToken;
                  // if (accessToken == null) {
                  //   throw 'No Access Token found.';
                  // }
                  // if (idToken == null) {
                  //   throw 'No ID Token found.';
                  // }
                  // await supabase.auth.signInWithIdToken(
                  //   provider: OAuthProvider.google,
                  //   idToken: idToken,
                  //   // accessToken: accessToken,
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Login With Google')],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
