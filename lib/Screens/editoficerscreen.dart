import 'dart:io';

import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditOfficerScreen extends StatefulWidget {

  final Map<String, dynamic> officerData;
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

  String? publicid;

  String? imageurl;

  bool isloading = false;

  final _formkey = GlobalKey<FormState>();
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

    mobileController = TextEditingController(text: widget.officerData['mobile']);

    selectedPost = widget.officerData['post'];

    imageurl = widget.officerData['imageUrl'];

    publicid = widget.officerData['publicId'];
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
      body:isloading
          ?Center(child: CircularProgressIndicator(),)
          :SingleChildScrollView(
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
                child: Form(
                  key: _formkey,
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

                          GestureDetector(
                            child: CircleAvatar(
                                foregroundImage: NetworkImage(
                                    image!=null
                                        ?image!.path
                                        :imageurl!
                                ),


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


                            ),

                            onTap: (){
                              imagepicers();
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 25),

                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "पदाधिकाऱ्याचे नाव",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter officer name';
                          }
                          return null;
                        },

                      ),

                      const SizedBox(height: 20),

                      TextFormField(
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
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Enter mobile number';
                          }

                          if (value.length != 10) {
                            return 'Enter a valid 10-digit mobile number';
                          }

                          if (int.tryParse(value) == null) {
                            return 'Only numbers are allowed';
                          }

                          return null;

                        },
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
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton.icon(
                onPressed: () async {
                  if(_formkey.currentState!.validate()){

                    setState(() {
                      isloading=true;
                    });

                    await Future.delayed(Duration(seconds: 2));



                    Navigator.pop(context, {

                      'image': image,
                      "mobile": mobileController.text,
                      "name": nameController.text,
                      "post": selectedPost,
                      'publicId':publicid


                    });
                  }
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