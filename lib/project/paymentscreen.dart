import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/modal/modal_class.dart';
import 'package:shopease/order.dart';
import 'package:shopease/providers/orders_provider.dart';

class Paymentscreen extends StatefulWidget {
  final Product? box;
  final double? itemPrice;

  const Paymentscreen({super.key, this.box, this.itemPrice});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  final formkey = GlobalKey<FormState>();
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    final priceToShow = widget.itemPrice ?? widget.box?.price ?? 0.0;
    final order = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PAYMENT METHOD'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          if (widget.box != null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(30),
                      child: Image.network(
                        widget.box!.url,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(
                    widget.box!.name,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 96, 96, 96),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.box!.category,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 255, 255),
                              const Color.fromARGB(255, 255, 156, 131),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            widget.box!.discount,
                            style: TextStyle(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 241, 54, 41),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.box == null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Buying all cart items",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Pincode is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter Pincode',
                            prefixIcon: const Icon(Icons.numbers),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
                            labelText: 'Select',
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
                            DropdownMenuItem(value: 'UPI', child: Text('UPI')),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 234, 234, 234),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              if (widget.box != null)
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 255, 255, 255),
                        const Color.fromARGB(255, 255, 156, 131),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      widget.box!.discount,
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 241, 54, 41),
                      ),
                    ),
                  ),
                ),
              Text(
                '₹${priceToShow.toString()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF512F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  order.additem(widget.box!.toMap());
                  if (formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDone(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Pay ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
