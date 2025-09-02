import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> _imagepickfun() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        _image = File(pickedfile.path);
      });
    }
  }

  List<Map<String, dynamic>> products = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fatchdata();
  }

  void operations() async {
    final data = await supabase.from('students').insert({
      'name': 'alice',
      'age': '34',
    });
    print('$data,derdsf');
  }

  void fatchdata() async {
    final output = await supabase.from('product').select();
    print('${output},kfk');
    setState(() {
      products = List<Map<String, dynamic>>.from(output);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text('Prectice'),
      ),
      body: Column(
        children: [
          _image == null
              ? const Text('no image select')
              : kIsWeb
              ? Image.network(_image!.path, height: 150)
              : Image.file(File(_image!.path), height: 150),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final student = products[index];
                return Card(
                  child: ListTile(
                    title: Text(student['name']),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(student['url']),
                    ),
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              _imagepickfun();
            },
            child: Icon(Icons.camera_alt),
          ),
          ElevatedButton(
            onPressed: () {
              operations();
            },
            child: Text('Perform operation'),
          ),
        ],
      ),
    );
  }
}
