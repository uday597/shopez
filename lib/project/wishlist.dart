import 'package:flutter/material.dart';
import 'package:shopease/providers/Wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WishlistProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<WishlistProvider>(context).wishlist;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(
              'Wishlist',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fav.length,
              itemBuilder: (context, index) {
                final item = fav[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item['url']),
                      ),
                      subtitle: Text(item['price'].toString()),

                      title: Text(item['name']),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<WishlistProvider>(
                            context,
                            listen: false,
                          ).removeitem(item);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
