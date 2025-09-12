import 'package:flutter/material.dart';

Widget buildMenuItem({
  required IconData icon,
  required String title,
  String? subtitle,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.pinkAccent),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    ),
  );
}

class reuseableText {}
