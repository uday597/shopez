import 'package:flutter/material.dart';
import 'package:shopease/modal/modal_class.dart';
import 'package:shopease/project/paymentscreen.dart';

import 'package:shopease/providers/cart_provider.dart';

import 'package:provider/provider.dart';

class Itemsinfo extends StatefulWidget {
  final Product list;

  const Itemsinfo({super.key, required this.list});

  @override
  State<Itemsinfo> createState() => _ItemsinfoState();
}

class _ItemsinfoState extends State<Itemsinfo> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 20),
            Image.network(widget.list.url, height: 250),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.list.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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
                          fontSize: 22,
                        ),

                        children: [
                          TextSpan(
                            text: widget.list.price.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              color: const Color.fromARGB(192, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 255, 184, 184),
                          Colors.red,
                        ],
                      ),
                    ),
                    height: 20,
                    width: 60,
                    child: Center(
                      child: Text(
                        widget.list.discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Description:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.list.description,
                style: const TextStyle(
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Color.fromARGB(150, 0, 0, 0),
                        size: 26,
                      ),
                      Text(
                        'Secure Payment',
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(
                        Icons.fire_truck,
                        size: 26,
                        color: Color.fromARGB(150, 0, 0, 0),
                      ),
                      Text(
                        'COD Available',
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 6,
                children: [
                  Icon(
                    Icons.public,
                    color: Color.fromARGB(150, 0, 0, 0),
                    size: 26,
                  ),
                  Text(
                    'Worldwide Shipping',
                    style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Paymentscreen(box: widget.list),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 252, 86, 36),
              ),
              child: Row(
                spacing: 8,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Icon(Icons.shopping_bag, size: 20),
                ],
              ),
            ),
          ),
          TextButton(
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

              Provider.of<CartProviders>(
                context,
                listen: false,
              ).addItem(widget.list);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 252, 86, 36),
            ),

            child: Row(
              spacing: 8,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(Icons.shopping_cart, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
