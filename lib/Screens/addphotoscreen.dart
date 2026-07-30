import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'नवीन फोटो जोडा'),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Photo Card
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

            /// Caption Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "कॅप्शन",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "येथे कॅप्शन लिहा...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text(
                  "सेव्ह करा",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}