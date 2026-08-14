import 'package:flutter/material.dart';

class Addphototextfieldcard extends StatelessWidget {
  final String title;
  final String hinttext;
  final int maxline;
  final TextEditingController controller;
  final String? Function(String?) validators;

  const Addphototextfieldcard({
    super.key,
    required this.title,
    required this.hinttext,
    required this.maxline,
    required this.controller,
    required this.validators
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: controller,
              maxLines: maxline,
              decoration: InputDecoration(
                  hintText: hinttext,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12,),
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12,),
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  )
                  ,

            ),
              validator: validators,
            )
          ]
        ),
      ),
    );
  }
}

//'"येथे छायाचित्राचे नाव लिहा..."'
