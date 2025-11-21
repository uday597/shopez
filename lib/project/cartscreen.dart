import 'package:flutter/material.dart';
import 'package:shopease/project/paymentscreen.dart';
import 'package:shopease/providers/cart_provider.dart';

import 'package:provider/provider.dart';

class Cartitems extends StatefulWidget {
  const Cartitems({super.key});

  @override
  State<Cartitems> createState() => _CartitemsState();
}

class _CartitemsState extends State<Cartitems> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProviders>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProviders>(context);
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
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(),
        child: provider.isloading
            ? Center(child: const CircularProgressIndicator())
            : ListView.builder(
                itemCount: cartitem.length,
                itemBuilder: (context, index) {
                  final data = cartitem[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 3),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(40),
                          child: Image.network(
                            data.url,
                            fit: BoxFit.contain,
                            height: 60,
                            width: 60,
                          ),
                        ),
                        title: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          data.name,
                          style: TextStyle(
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text('₹${data.price}', maxLines: 1),
                        trailing: SizedBox(
                          width: 180,
                          child: Consumer<CartProviders>(
                            builder: (context, value, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      value.decrementQuantity(data);
                                    },
                                    icon: Icon(Icons.remove),
                                  ),

                                  Text(data.quantity.toString()),
                                  IconButton(
                                    onPressed: () {
                                      value.incrementQuantity(data);
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                            'Remove Item',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: Text(
                                            'Are you sure you want to remove this item from cart',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                              ),
                                              onPressed: () {
                                                value.removeItem(data);
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
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
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(),
        child: Consumer<CartProviders>(
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
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      Text(
                        ' ${value.totalPrice}',
                        style: TextStyle(
                          fontSize: 20,

                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 255, 184, 184),
                            Colors.red,
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Paymentscreen(itemPrice: value.totalPrice),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Buy all'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
