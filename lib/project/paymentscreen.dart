import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/modal/modal_class.dart';
import 'package:shopease/order.dart';
import 'package:shopease/providers/orders_provider.dart';

class Buyscreen extends StatefulWidget {
  final Product box;
  // final double item;
  const Buyscreen({super.key, required this.box});

  @override
  State<Buyscreen> createState() => _BuyscreenState();
}

class _BuyscreenState extends State<Buyscreen> {
  final formkey = GlobalKey<FormState>();
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Payment Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Enter Your Details",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 20),

                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Name is required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),

                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Address is required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                  prefixIcon: const Icon(Icons.home),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 15),

                              TextFormField(
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Mobile number is required";
                                  } else if (value.length != 10) {
                                    return "Enter a valid 10-digit number";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Mobile No',
                                  prefixIcon: const Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),

                              DropdownButtonFormField<String>(
                                value: selectedPayment,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a payment method";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Select Payment Method',
                                  prefixIcon: const Icon(Icons.payment_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Gpay',
                                    child: Text('GPay'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'UPI',
                                    child: Text('UPI'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Card',
                                    child: Text('Credit/Debit Card'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedPayment = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 25),

                              const Text(
                                'Payment Amount',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "₹ ${widget.box.price}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 62, 61, 61),
                                ),
                              ),
                              const SizedBox(height: 40),

                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF512F),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      order.additem(widget.box.toMap());
                                      if (formkey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const OrderDone(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Pay ',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
