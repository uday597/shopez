import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import 'package:newproject/project/about_us.dart';
import 'package:newproject/project/cartscreen.dart';
import 'package:newproject/project/contact_us.dart';

import 'package:newproject/project/productinfo.dart';
import 'package:newproject/project/terms_conditions.dart';
import 'package:newproject/project/wishlist.dart';
import 'package:newproject/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../modal/modal_class.dart' show ProductClass, Product;

final ProductClass modal = ProductClass();
final productinfo = modal.productlist;

class Productlist extends StatefulWidget {
  const Productlist({super.key});
  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  List<Product> productlist = [];
  TextEditingController searchcontroller = TextEditingController();
  String selectedFilter = 'all'; // default selected filter
  bool isSelected = false;

  void addTOcart(Product item) {
    setState(() {
      productlist.add(item);
    });
  }

  void filterlist(String type) {
    setState(() {
      if (type == 'all') {
        productlist = productinfo.toList();
      } else {
        productlist = productinfo
            .where(
              (item) => item.category.toString().toLowerCase().contains(
                type.toLowerCase(),
              ),
            )
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    productlist = productinfo;
  }

  void searchfilter(String quary) {
    final searchitem = productinfo.where((item) {
      final name = item.name.toString().toLowerCase();
      return name.contains(quary.toLowerCase());
    }).toList();
    setState(() {
      productlist = searchitem;
    });
  }

  Future<void> _signout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

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

            SizedBox(height: 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await _signout(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 41, 117),
                  minimumSize: Size(100, 30),
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
                        onChanged: searchfilter,
                        controller: searchcontroller,
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
                              filterlist(value);
                            });
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

            CommonGridView(productinfo: productlist),
          ],
        ),
      ),
    );
  }
}

class CommonGridView extends StatefulWidget {
  final List<Product> productinfo;

  const CommonGridView({super.key, required this.productinfo});

  @override
  State<CommonGridView> createState() => _CommonGridViewState();
}

class _CommonGridViewState extends State<CommonGridView> {
  @override
  Widget build(BuildContext context) {
    void saveitem() {
      final database = Hive.box('myBox');
      database.put('wishlist', productinfo);
    }

    double widthsize = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;

    if (widthsize < 265) {
      crossAxisCount = 1;
    } else if (widthsize > 733) {
      crossAxisCount = 3;
    }
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.68,
        ),
        itemCount: productinfo.length,
        itemBuilder: (context, index) {
          final box = productinfo[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Itemsinfo(productsinfo: box),
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        box.buyers,
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 5,
                            top: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                width: 60,
                                color: const Color.fromARGB(255, 177, 17, 6),
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
                                '₹${box.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        IconButton(
                          onPressed: () {
                            Provider.of<WishlistProvider>(
                              context,
                              listen: false,
                            ).addproduct(box);
                            saveitem();
                            setState(() {
                              box.isFavourite = !box.isFavourite;
                            });
                          },
                          icon: box.isFavourite
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.blueGrey,
                                  size: 25,
                                ),
                        ),
                      ],
                    ),

                    // Price and Discount
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
