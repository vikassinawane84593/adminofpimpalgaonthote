import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const ImageCard({
    super.key,
    required this.imagePath,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(

                imagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,

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

              ),
            ),
          ),
        ),

        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black54,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 20,
              ),
              onPressed: onDelete,
            ),
          ),
        ),
      ],
    );
  }
}