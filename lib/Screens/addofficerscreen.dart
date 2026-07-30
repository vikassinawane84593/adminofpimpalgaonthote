import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AddOfficerScreen extends StatefulWidget {
  const AddOfficerScreen({super.key});

  @override
  State<AddOfficerScreen> createState() => _AddOfficerScreenState();
}

class _AddOfficerScreenState extends State<AddOfficerScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }
  List<Map<String, String>> menu = [
    {
      'post': 'सरपंच',
      'value': 'सरपंच',
    },
    {
      'post': 'उपसरपंच',
      'value': 'उपसरपंच',
    },
    {
      'post': 'ग्रामसेवक',
      'value': 'ग्रामसेवक',
    },
    {
      'post': 'ग्रामपंचायत सदस्य',
      'value': 'ग्रामपंचायत सदस्य',
    },
  ];
  String? selectedpost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "नवीन पदाधिकारी जोडा"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// Officer Information Card
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
                            Icons.person_outline,
                            color: Colors.green,
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
                            Text("पदाधिकाऱ्याची माहिती भरा"),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "पदाधिकाऱ्याचे नाव",
                        hintText: "नाव टाका",
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
                        hintText: "मोबाईल नंबर टाका",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),


                    DropdownButtonFormField<String>(

                        value: selectedpost,

                        decoration: InputDecoration(

                          hintText: "पद",
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        items: menu.map((e)=>DropdownMenuItem(
                          value: e['value'],
                          child: Text(e['post']!),


                        )).toList(),
                        onChanged: (valuse){})
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