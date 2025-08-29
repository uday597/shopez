import 'package:flutter/material.dart';
import 'package:newproject/project/account_page.dart';
import 'package:newproject/providers/cart_provider.dart';

import 'package:provider/provider.dart';

class Cartitems extends StatefulWidget {
  const Cartitems({super.key});

  @override
  State<Cartitems> createState() => _CartitemsState();
}

class _CartitemsState extends State<Cartitems> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProviders>(context, listen: false).loadItems();
    final cartitem = Provider.of<CartProviders>(context).itemList;

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
            title: Text('Cart Items'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            actions: [
              Consumer<CartProviders>(
                builder: (context, items, child) {
                  return Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          items.clearItem();
                        },
                        child: Text(
                          'Clear Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: cartitem.length,
        itemBuilder: (context, index) {
          final item = cartitem[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 3),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(item.url),
                ),
                title: Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('₹${item.price}'),
                trailing: SizedBox(
                  width: 180,
                  child: Consumer<CartProviders>(
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              value.decrementQuantity(item);
                            },
                            icon: Icon(Icons.remove),
                          ),

                          Text(item.quantity.toString()),
                          IconButton(
                            onPressed: () {
                              value.incrementQuantity(item);
                            },
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {
                              value.removeItem(item);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<CartProviders>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Total Price : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    Text(
                      '${value.totalPrice}',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 43, 15, 90),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 73, 26),
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Buy'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
