import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {}, 
      icon: const Icon(Icons.add),
      color: Colors.blue,
    );
  }
}