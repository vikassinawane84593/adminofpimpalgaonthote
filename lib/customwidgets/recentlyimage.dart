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
              child: Image.network(
                  imageurl,

                loadingBuilder: (context,child,loadingprogress){
                  if(loadingprogress==null){
                    return child;
                  }

                  return CircularProgressIndicator(
                    color: Colors.black,
                  );
                },

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Text("Image Not Found"),
                    ),
                  );
                },


                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (frame == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }

                  return child;
                },
              )
            ),
          ),
        ),
      ),
    );
  }
}
//'https://picsum.photos/300/30$index
