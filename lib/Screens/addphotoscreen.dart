import 'dart:async';
import 'dart:convert';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/addphototextfieldcard.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class AddGalleryScreen extends StatefulWidget {
  const AddGalleryScreen({super.key});

  @override
  State<AddGalleryScreen> createState() => _AddGalleryScreenState();
}

class _AddGalleryScreenState extends State<AddGalleryScreen> {
  XFile? image;

  final ImagePicker imagePicker = ImagePicker();

  Future <void> imagepickers()async {

    XFile? pickedimage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedimage!=null ){

      setState(() {

        image= pickedimage;

      });
    }
  }

  Future<String> uploadToCloudinary(XFile image) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/tzbaeh0q/image/upload',
    );

    final imageBytes = await image.readAsBytes();

    final request = http.MultipartRequest(
      'POST',
      url,
    );

    request.fields['upload_preset'] = 'flutter_gallery';

    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: image.name,
      ),
    );

    final response = await request.send();

    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = jsonDecode(responseBody);

      print('code ended');

      return data['secure_url'];
    } else {
      final data = jsonDecode(responseBody);
      print('code endid');

      throw Exception(

        'Cloudinary upload failed: ${data['error']['message']}',

      );
    }
  }

  bool cirulerindicater = false;



  TextEditingController namecontroller = TextEditingController();

  TextEditingController cationcontroller = TextEditingController();

  final formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'नवीन फोटो जोडा'),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [

                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Color(0xffE8F5E9),
                              child: Icon(
                                Icons.image_outlined,
                                color: Colors.green,
                              ),
                            ),

                            SizedBox(width: 15),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "फोटो निवडा",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("गॅलरीमधून फोटो निवडा"),
                              ],
                            )
                          ],
                        ),

                        const SizedBox(height: 20),

                        InkWell(

                          onTap: (){
                            imagepickers();

                          },
                          child: Container(
                            height: 240,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.green,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: image!=null?
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                image!.path,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                                :
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 70,
                                  color: Colors.green,
                                ),

                                SizedBox(height: 15),

                                Text(
                                  "फोटो निवडण्यासाठी येथे टॅप करा",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 8),

                                Text(
                                  "JPG, PNG",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Addphototextfieldcard(
                  controller:namecontroller ,
                  title: 'छायाचित्राचे नाव',
                  hinttext: 'येथे छायाचित्राचे नाव लिहा...',
                  maxline: 1,
                  validators: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "कृपया छायाचित्राचे नाव प्रविष्ट करा";
                    }

                    if (value.trim().length < 3) {
                      return "नाव किमान 3 अक्षरांचे असावे";
                    }

                    return null;
                  },
                ),




                Addphototextfieldcard(
                  controller: cationcontroller,
                  title: 'कॅप्शन',
                  hinttext: 'येथे कॅप्शन लिहा...',
                  maxline: 4,

                  validators: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "कृपया छायाचित्राचे वर्णन प्रविष्ट करा";
                    }

                    if (value.trim().length < 10) {
                      return "वर्णन किमान 10 अक्षरांचे असावे";
                    }

                    return null;
                  },
                ),



                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton.icon(
                      onPressed: !cirulerindicater
                        ?() async {
                        try {

                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("कृपया फोटो निवडा"),
                              ),
                            );

                            return;
                          }








                          //  final Uint8List imageData = await image!.readAsBytes();


                          //  await ref.putData(imageData);

                          if (!(formkey.currentState!.validate())) {
                            return;
                          }

                          setState(() {
                            cirulerindicater = true;
                          });



                          final fileName = (namecontroller.text.trim()) + (DateTime
                              .now()
                              .millisecondsSinceEpoch).toString();

                          final url = await uploadToCloudinary(image!);


                          await FirebaseFirestore.instance
                              .collection('gallery')
                              .add({
                            'name': namecontroller.text.trim(),
                            'caption': cationcontroller.text.trim(),
                            'imageUrl': url,
                            'fileName': fileName,
                            'uploadedAt': FieldValue.serverTimestamp(),
                          });


                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("फोटो यशस्वीरित्या सेव्ह झाला"),
                            ),
                          );


                          setState(() {
                            image=null;
                            cirulerindicater= false;
                          });
                          namecontroller.clear();
                          cationcontroller.clear();
                        }

                        catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                          setState(() {
                            cirulerindicater= false;
                          });
                        }

                      }
                      :null,

                      icon:!cirulerindicater
                          ? const Icon(Icons.save)
                          :SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          )
                      )
                      ,
                      label: cirulerindicater ?
                      const Text(
                        "सेव्ह करा",
                        style: TextStyle(fontSize: 16),
                      )
                          :Text(
                        'सेव्ह होत आहे...',
                        style: TextStyle(fontSize: 16),
                      )


                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}