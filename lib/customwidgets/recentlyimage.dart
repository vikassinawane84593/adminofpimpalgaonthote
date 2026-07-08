import 'package:flutter/material.dart';

class Recentlyimage extends StatelessWidget {

  final String imageurl;
  final VoidCallback ontap;

   const Recentlyimage({

    super.key,
    required this.imageurl,
    required this.ontap

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: InkWell(
          onTap:  ontap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),



            child: Center(
              child: Image.network(imageurl)
            ),
          ),
        ),
      ),
    );
  }
}
//'https://picsum.photos/300/30$index
