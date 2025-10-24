import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopease/project/Wishlist.dart';
import 'package:shopease/project/about_us.dart';
import 'package:shopease/project/cartscreen.dart';
import 'package:shopease/project/contact_us.dart';
import 'package:shopease/project/myorders.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home/widgets/container.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final user = Supabase.instance.client.auth.currentUser;

  late final photourl = user?.userMetadata?['picture'];
  Future<void> _signout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) {
      context.go('/');
    }
  }

  // final user = Supabase.instance.client.auth.currentUser;

  // File? _image;
  // final ImagePicker _picker = ImagePicker();

  // Future<void> _imagepickfun() async {
  //   final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedfile != null) {
  //     setState(() {
  //       _image = File(pickedfile.path);
  //     });
  //   }
  // }

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
            borderRadius: BorderRadius.vertical(),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      color: const Color.fromARGB(153, 203, 203, 203),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6A4C), Color(0xFFEE1376)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(photourl),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          user?.userMetadata?['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Text(
                        user?.email ?? 'No Email',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildMenuItem(
              icon: Icons.person_2_outlined,
              title: 'My Profile',

              onTap: () {},
            ),
            buildMenuItem(
              icon: Icons.shopping_cart_outlined,
              title: 'Cart',

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Cartitems()),
                );
              },
            ),
            buildMenuItem(
              icon: Icons.shopping_basket_outlined,
              title: 'Orders',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Myorders()),
              ),
            ),
            buildMenuItem(
              icon: Icons.favorite_border_outlined,
              title: 'Wishlist',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WishlistScreen()),
              ),
            ),

            buildMenuItem(
              icon: Icons.headset_mic_outlined,
              title: 'Contact us',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContactInfo()),
              ),
            ),
            buildMenuItem(
              icon: Icons.info_outline,
              title: 'About us',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutUspage()),
              ),
            ),
            buildMenuItem(
              icon: Icons.settings,
              title: 'Settings',

              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Coming Soon  🚀',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
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
