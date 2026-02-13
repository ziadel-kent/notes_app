import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon, this.onPressed,});
  final String text;
  final void Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 1),
          CustomSearch(icon: icon,onPressed: onPressed,),
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.icon, this.onPressed});
  final Icon icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(.05),
      ),
      child: Center(child: IconButton(onPressed: onPressed, icon: icon)),
    );
  }
}
