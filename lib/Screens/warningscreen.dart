import 'package:flutter/material.dart';

class WarningUploadScreen extends StatefulWidget {
  const WarningUploadScreen({super.key});

  @override
  State<WarningUploadScreen> createState() => _WarningUploadScreenState();
}

class _WarningUploadScreenState extends State<WarningUploadScreen> {
  final TextEditingController warningController = TextEditingController();

  DateTime? selectedDate;

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(20100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color.lerp(Colors.red, Colors.white, 0.9),
      appBar: AppBar(
        title: const Text("सूचना अपलोड करा"),
        backgroundColor: Color.lerp(Colors.red, Colors.white, 0.9),

      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Card(
            color: Color.lerp(Colors.red, Colors.white, 0.8),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.warning,color: Colors.red,),
                      ),
                      Text(
                        "Add Warning",
                        style: theme.textTheme.headlineSmall,
                       ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: warningController,
                    maxLines: 3,
                    decoration: const InputDecoration(

                      labelText: "सूचना",
                      hintText: "Enter warning...",
                      border: OutlineInputBorder(),


                      focusedBorder: OutlineInputBorder(),

                      enabledBorder: OutlineInputBorder()

                    ),
                  ),

                  const SizedBox(height: 20),

                  InkWell(
                    onTap: pickDate,
                    child: Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(width: 10),
                          Text(
                            selectedDate == null
                                ? "Select Date"
                                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            warningController.clear();
                            setState(() {
                              selectedDate = null;
                            });
                          },
                          child:  Text(
                            "Clear",
                            style:theme.textTheme.titleMedium,


                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.lerp(Colors.green, Colors.white, 0.7)
                          ),
                          onPressed: () {
                            // Upload to Firebase
                          },
                          icon:  Icon(
                              Icons.upload,
                              color: Colors.black,
                          ),

                          label:  Text(
                              "Upload",
                            style: theme.textTheme.titleMedium,

                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}