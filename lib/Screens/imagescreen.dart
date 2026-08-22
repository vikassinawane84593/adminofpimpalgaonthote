import 'package:adminpanelofpimpalgaonthtevilage/Screens/addphotoscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/full_image_screen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/Imagewidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Imagescreen extends StatefulWidget {
  const Imagescreen({super.key});

  @override
  State<Imagescreen> createState() => _ImagescreenState();
}

class _ImagescreenState extends State<Imagescreen> {
  Future  ondelet(  String docid) async {

    await FirebaseFirestore.instance
        .collection('gallery')
        .doc(docid)
        .delete();

  }
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
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('gallery').snapshots(),
                builder: (context,snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index){

                        final doc = docs[index];
                        return ImageCard(
                          imagePath: docs[index]['imageUrl'],
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (_)=>FullImageScreen(imageurl: doc['imageUrl'])
                            ),
                            );
                          },

                          onDelete:() {

                            ondelet( doc.id);

                          }
                        );
                      }
                  );

                }
            ),
          ),
        ],
      ),
    );
  }
}
