import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopease/project/Wishlist.dart';
import 'package:shopease/project/cartscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home/widgets/container.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  Future<void> _signout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) {
      context.go('/');
    }
  }

  final user = Supabase.instance.client.auth.currentUser;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _imagepickfun() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        _image = File(pickedfile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF6A4C), Color(0xFFEE1376)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: AppBar(
            title: Text("My Profile"),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,

            foregroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _imagepickfun,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: _image != null
                          ? (kIsWeb
                                    ? NetworkImage(_image!.path)
                                    : FileImage(_image!))
                                as ImageProvider
                          : null,
                      child: _image == null
                          ? const Icon(
                              Icons.person,
                              size: 55,
                              color: Colors.grey,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user?.email ?? 'No Email',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            buildMenuItem(
              icon: Icons.person_2_outlined,
              title: 'My Profile',
              // subtitle: '',
              onTap: () {},
            ),
            buildMenuItem(
              icon: Icons.location_on_outlined,
              title: 'My Address',
              // subtitle: '',
              onTap: () {},
            ),
            buildMenuItem(
              icon: Icons.shopping_basket_outlined,
              title: 'Orders',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Cartitems()),
              ),
              // subtitle: '',
            ),
            buildMenuItem(
              icon: Icons.favorite_border_outlined,
              title: 'Wishlist',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WishlistScreen()),
              ),
              // subtitle: '',
            ),

            buildMenuItem(
              icon: Icons.settings,
              title: 'Settings',

              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () => _signout(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.pinkAccent,
            elevation: 4,
          ),
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
