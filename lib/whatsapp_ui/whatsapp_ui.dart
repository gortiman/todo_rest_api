import 'package:flutter/material.dart';

class WhatsAppUI extends StatelessWidget {
  const WhatsAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('WhatsApp'),

        actions: [
          Icon(Icons.search),
          Icon(Icons.menu),
        ],
      ),
    );
  }
}
