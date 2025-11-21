import 'package:flutter/material.dart';

class Trackorder extends StatefulWidget {
  final Map<String, dynamic> item;
  const Trackorder({super.key, required this.item});

  @override
  State<Trackorder> createState() => _TrackorderState();
}

class _TrackorderState extends State<Trackorder> {
  bool _showdetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(widget.item['url'], fit: BoxFit.fill),
                ),
                title: Text(widget.item['name']),
                subtitle: Text(widget.item['date']),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipped',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.green,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'On Time',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.item['date']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                        Expanded(
                          child: Divider(color: Colors.green, thickness: 4),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            height: 4,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        CircleAvatar(radius: 15, child: Icon(Icons.check)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Confirmed'),
                        Padding(
                          padding: const EdgeInsets.only(right: 45),
                          child: Text('Shipped'),
                        ),
                        Text('Delivery'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Oct 26'),
                        Padding(
                          padding: const EdgeInsets.only(left: 92.0),
                          child: Text('Oct 27'),
                        ),

                        Text('Thu Oct 30 by 11 PM'),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  Divider(),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _showdetails = !_showdetails;
                        });
                      },
                      icon: Icon(
                        _showdetails
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      label: Text(
                        _showdetails ? 'Hide Details' : 'See all updates',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: SizedBox.shrink(),
                    secondChild: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text(
                            'Order confirmed',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your order has been confirmed.',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text('Thu Oct 26 by 11 PM.'),
                              Text(
                                'Seller has processed your order',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text('Thu Oct 27 by 2:06 PM.'),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.local_shipping,
                            color: Colors.green,
                          ),
                          title: Text(
                            'Order shipped',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'your item has been shipped',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text('Sat Oct 27 by 11:08 PM.'),
                              Text(
                                'Your item has arrived at a delivery patner facility',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),

                              Text('Sat Oct 30 by 4:30 PM.'),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.home, color: Colors.grey),
                          title: Text('Out for delivery'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Item yet to be delivered'),
                              Text('Expected by Thu Oct 30, 11 PM.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    crossFadeState: _showdetails
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Duration(microseconds: 300),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
