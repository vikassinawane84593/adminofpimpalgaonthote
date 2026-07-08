
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget{

  final String imageurl;

  const FullImageScreen({
    super.key,
    required this.imageurl
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:InteractiveViewer(

          child: Image.network(
              height: double.infinity,
              width: double.infinity,
              imageurl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

  }
}
