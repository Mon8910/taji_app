import 'package:flutter/material.dart';

class ContestantIcon extends StatelessWidget{
  const ContestantIcon({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image.asset(image),
       const SizedBox(height: 5,),
        Text(text,style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 43, 100, 138)
        ),)

      ],
    );
  }

}