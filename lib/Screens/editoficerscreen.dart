import 'dart:io';

import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditOfficerScreen extends StatefulWidget {

  final Map<String, String> officerData;
  const EditOfficerScreen({
    super.key,
    required this.officerData
  });

  @override
  State<EditOfficerScreen> createState() => _EditOfficerScreenState();
}

class _EditOfficerScreenState extends State<EditOfficerScreen> {
  late TextEditingController nameController;

  // TextEditingController(text: widget.officerData[0]);

  late TextEditingController mobileController;

  //TextEditingController(text: "9876543210");

  String? selectedPost;

  ImagePicker imagePicker = ImagePicker();

  XFile? image;

  final List<Map<String, String>> menu = [
    {'post': 'सरपंच', 'value': 'सरपंच'},
    {'post': 'उपसरपंच', 'value': 'उपसरपंच'},
    {'post': 'ग्रामसेवक', 'value': 'ग्रामसेवक'},
    {'post': 'ग्रामपंचायत सदस्य', 'value': 'ग्रामपंचायत सदस्य'},
  ];

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.officerData['name']);

    mobileController = TextEditingController(text: widget.officerData['phone']);

    selectedPost = widget.officerData['position'];
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  Future<void> imagepicers() async {
    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);


    if (xFile != null) {
      setState(() {
        image = xFile;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "पदाधिकारी संपादित करा",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Color(0xffE8F5E9),
                          child: Icon(
                            Icons.edit,
                            color: Color(0xff98c39b),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "पदाधिकारी माहिती",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("माहितीमध्ये आवश्यक बदल करा"),
                          ],
                        ),

                        Spacer(),

                        CircleAvatar(
                          foregroundImage: image!=null
                              ?NetworkImage(image!.path)
                              :null,

                            radius: 30,
                            backgroundColor: Color(0xffb7eabb),


                            child:
                            image==null?
                            IconButton(onPressed: (){

                              imagepicers();

                            },
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                ))
                                :null


                        )
                      ],
                    ),
                    const SizedBox(height: 25),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "पदाधिकाऱ्याचे नाव",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: "मोबाईल नंबर",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    DropdownButtonFormField<String>(
                      value: selectedPost,
                      decoration: InputDecoration(
                        labelText: "पद",
                        prefixIcon: const Icon(Icons.work_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: menu.map((e) {
                        return DropdownMenuItem<String>(
                          value: e['value'],
                          child: Text(e['post']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPost = value;
                        });
                      },
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
                onPressed: () {

                  Navigator.pop(context, {


                    "name": nameController.text,
                    "position": selectedPost!,
                    "phone": mobileController.text,


                  });


                },
                icon: const Icon(Icons.save),
                label: const Text(
                  "बदल जतन करा",
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