import 'package:flutter/material.dart';

class Buyscreen extends StatefulWidget {
  const Buyscreen({super.key});

  @override
  State<Buyscreen> createState() => _BuyscreenState();
}

class _BuyscreenState extends State<Buyscreen> {
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
            title: Text(
              'Payment',
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
            Image.asset('assets/images/card.png', height: 200, width: 400),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT27mNiyLBx_WW5a1PY7y7b6rncoD2Ir4Y5A&ss',

                    height: 40,
                    width: 60,
                  ),
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi1wUyeiehGzwuLov7nBE_UXLbkD8K6nJZMg&s',

                  height: 40,
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa_kWNlRt9K4lE3wirR4TcfD3VoerHAQXP5Q&s',

                    height: 40,
                    width: 60,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Payment amount', style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₹500.00', style: TextStyle(fontSize: 20)),
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Name of card', style: TextStyle(fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Card number', style: TextStyle(fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Expiry date', style: TextStyle(fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'MM/YY',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('ZIP/Postal code', style: TextStyle(fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 85, 36),
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock, size: 25),
                    Text(' Pay ₹500.00', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
