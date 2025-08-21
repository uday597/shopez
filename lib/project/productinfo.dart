import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newproject/modal/modal_class.dart';

import 'package:newproject/providers/cart_provider.dart';

import 'package:provider/provider.dart';

class Itemsinfo extends StatefulWidget {
  final Product productsinfo;

  const Itemsinfo({super.key, required this.productsinfo});

  @override
  State<Itemsinfo> createState() => _ItemsinfoState();
}

class _ItemsinfoState extends State<Itemsinfo> {
  @override
  Widget build(BuildContext context) {
    void savedata() {
      final database = Hive.box('myBox');
      database.put('items', widget.productsinfo);
    }

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
            title: const Text('Product Information'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Image.network(widget.productsinfo.url, height: 250),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productsinfo.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Availble in stock',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,

                        child: RichText(
                          text: TextSpan(
                            text: 'Price: ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(223, 0, 0, 0),
                              fontSize: 20,
                            ),

                            children: [
                              TextSpan(
                                text: widget.productsinfo.price.toStringAsFixed(
                                  0,
                                ),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(192, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 60,
                        color: const Color.fromARGB(255, 177, 17, 6),
                        child: Center(
                          child: Text(
                            widget.productsinfo.discount,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Description:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.productsinfo.description,
                        style: const TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text(
                    "🎉 Added to Cart!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "Your item has been added to your cart successfully.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
            savedata();
            Provider.of<CartProviders>(
              context,
              listen: false,
            ).addItem(widget.productsinfo);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(380, 50),
            backgroundColor: const Color.fromARGB(255, 252, 86, 36),
          ),

          child: const Text(
            'Add To Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
