import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
      child: Row(
        children: [
          Text(
            'Notes',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 1),
          CustomSearch(),
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(.05),
      ),
      child: Center(child: Icon(Icons.search, size: 28)),
    );
  }
}
