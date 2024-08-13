import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final String imageUrl;

  const CustomChip({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl),
          fit: BoxFit.cover
          ),
          shape: BoxShape.rectangle,
        ),
      ),
      label: Text(text,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
      labelPadding: const EdgeInsets.only(left: 10,right: 20,top: 5,bottom: 5),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          width: 0.8,
          color: Color.fromARGB(255, 203, 203, 203)
        ) // Circular border radius
      ),
    );
  }
}
