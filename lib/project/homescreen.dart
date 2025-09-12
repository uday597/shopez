import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopease/project/about_us.dart';
import 'package:shopease/project/cartscreen.dart';
import 'package:shopease/project/contact_us.dart';
import 'package:shopease/project/productinfo.dart';
import 'package:shopease/project/terms_conditions.dart';
import 'package:shopease/project/Wishlist.dart';
import 'package:shopease/project/user_info.dart';
import 'package:shopease/providers/Wishlist_provider.dart';
import 'package:shopease/providers/supabase.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../modal/modal_class.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});
  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  List<Product> productlist = [];

  TextEditingController searchcontroller = TextEditingController();
  String selectedFilter = 'all';
  bool isFavourite = false;

  void _applyFilters(String query, String filter) {
    final provider = Provider.of<SupaProvider>(context, listen: false);

    List<Product> results = provider.list.cast<Product>();

    if (filter != 'all') {
      results = results.where((item) {
        final category = item.category.toLowerCase();
        return category.contains(filter.toLowerCase());
      }).toList();
    }

    if (query.isNotEmpty) {
      results = results.where((item) {
        final name = item.name.toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    }

    setState(() {
      productlist = results;
    });
  }

  Future<void> _signout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final wishprovider = Provider.of<WishlistProvider>(context);
    final provider = Provider.of<SupaProvider>(context);
    final user = Supabase.instance.client.auth.currentUser;
    if (productlist.isEmpty && provider.list.isNotEmpty) {
      productlist = provider.list;
    }
    double widthsize = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;

    if (widthsize < 391) {
      crossAxisCount = 1;
    } else if (widthsize > 733) {
      crossAxisCount = 3;
    }
    double itemWidth = (widthsize / crossAxisCount) - 20;

    double itemHeight = 260;
    double aspectRatio = itemWidth / itemHeight;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 106, 76),
                Color.fromARGB(255, 238, 19, 118),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Image.asset('assets/images/applogo.png', height: 55, width: 60),
                Text(
                  'ShopEase',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()),
                  );
                },
                icon: Icon(Icons.favorite_border_outlined),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInfo()),
                  );
                },
                icon: Icon(Icons.person_2_outlined),
              ),

              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ],

            foregroundColor: Colors.white,
          ),
        ),
      ),
      endDrawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 106, 76),
                    Color.fromARGB(255, 238, 19, 118),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                currentAccountPictureSize: Size(40, 40),
                accountName: Text("Hello User 👋"),
                accountEmail: Text(user?.email ?? "No Email"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cartitems()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUspage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Terms & Conditions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsConditions()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text('Contact us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactInfo()),
                );
              },
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await _signout(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 41, 117),
                  minimumSize: Size(double.infinity, 34),
                ),
                child: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: TextField(
                        // onChanged: searchfilter,
                        controller: searchcontroller,
                        onChanged: (value) {
                          _applyFilters(value, selectedFilter);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 120,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            196,
                            194,
                            194,
                          ).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 1,
                        ),
                      ],
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.black,
                        value: selectedFilter,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedFilter = value;
                            });
                            _applyFilters(searchcontroller.text, value);
                          }
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'all',
                            child: Text(
                              'All Items',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Girls',
                            child: Text(
                              'Girls',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Mens',
                            child: Text(
                              'Mens',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Electronics',
                            child: Text(
                              'Electronics',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: provider.isloading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: aspectRatio,
                      ),
                      itemCount: productlist.length,
                      itemBuilder: (context, index) {
                        final box = productlist[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 1,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Itemsinfo(list: box),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 197, 195, 195),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Image
                                  Container(
                                    height: 130,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(box.url),
                                        fit: BoxFit.contain,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      top: 10,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      box.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      box.buyers,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                          178,
                                          0,
                                          0,
                                          0,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 5,
                                          top: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 60,
                                              color: const Color.fromARGB(
                                                255,
                                                177,
                                                17,
                                                6,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  box.discount,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              '₹${box.price}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          if (wishprovider.isInWishlist(
                                            box.id,
                                          )) {
                                            wishprovider.removeitem(
                                              box.toMap(),
                                            );
                                          } else {
                                            wishprovider.additem(box.toMap());
                                          }
                                        },
                                        icon: Icon(
                                          wishprovider.isInWishlist(box.id)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              wishprovider.isInWishlist(
                                                box.id.toString(),
                                              )
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Product {
//   final String name;
//   final String description;
//   double price = 9;

//   Product(this.price, {required this.name, required this.description});
// }
