import 'package:flutter/material.dart';

class CustomNavBarWidget extends StatelessWidget {
  final List<Widget> items;

  const CustomNavBarWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
          children: [...items,]),
    );
  }
}
