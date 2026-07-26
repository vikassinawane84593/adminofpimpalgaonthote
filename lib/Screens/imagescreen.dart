import 'package:adminpanelofpimpalgaonthtevilage/Screens/addgalleryscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/full_image_screen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/Imagewidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Imagescreen extends StatefulWidget {
  const Imagescreen({super.key});

  @override
  State<Imagescreen> createState() => _ImagescreenState();
}

class _ImagescreenState extends State<Imagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Column(

        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(

              height: 70,
              width: double.infinity,
              child: TextButton(

                style:TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal()
                  )
                ),
                  onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_)=>AddGalleryScreen())

                  );

                  }
                  , child: Text(
                'फोटो जोडा',
                style: Theme.of(context).textTheme.titleMedium,
              )),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index) {
                  return ImageCard(
                    imagePath: 'https://picsum.photos/300/$index',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (_)=>FullImageScreen(imageurl: 'https://picsum.photos/300/$index',)
                      ),
                      );
                    },
                  );
                }
                ),
          ),
        ],
      ),
    );
  }
}
