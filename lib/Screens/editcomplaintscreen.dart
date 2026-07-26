import 'package:flutter/material.dart';
import 'package:adminpanelofpimpalgaonthtevilage/model/complaintmodel.dart';

class EditComplaintScreen extends StatefulWidget {
  final Complaintmodel complaint;

  const EditComplaintScreen({
    super.key,
    required this.complaint,
  });

  @override
  State<EditComplaintScreen> createState() => _EditComplaintScreenState();
}

class _EditComplaintScreenState extends State<EditComplaintScreen> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController relatedController;

  String status = "Pending";

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.complaint.name);

    mobileController = TextEditingController(text: widget.complaint.mobnumber.toString(),);

    relatedController = TextEditingController(text: widget.complaint.related,);

    status = widget.complaint.conditionl;
  }

  @override
  void dispose() {

    nameController.dispose();
    mobileController.dispose();
    relatedController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("तक्रार संपादित करा"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "नाव",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "मोबाईल नंबर",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: relatedController,
              decoration: const InputDecoration(
                labelText: "तक्रारीचा विषय",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: status,
              decoration: const InputDecoration(
                labelText: "स्थिती",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
              items: const [
                DropdownMenuItem(
                  value: "Pending",
                  child: Text("Pending"),
                ),
                DropdownMenuItem(
                  value: "Solved",
                  child: Text("Solved"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  status = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    Complaintmodel(
                      id: widget.complaint.id,
                      name: nameController.text,
                      mobnumber: int.parse(mobileController.text),
                      related: relatedController.text,
                      date: widget.complaint.date,
                      time: widget.complaint.time,
                      conditionl: status,
                    ),
                  );
                },
                child:  Text(
                  "Save",
                  style: Theme.of(context).textTheme.titleMedium

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}