import 'dart:io';

import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddOfficerScreen extends StatefulWidget {
  const AddOfficerScreen({super.key});

  @override
  State<AddOfficerScreen> createState() => _AddOfficerScreenState();
}

class _AddOfficerScreenState extends State<AddOfficerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();

  final List<String> _posts = const [
    'सरपंच',
    'उपसरपंच',
    'ग्रामसेवक',
    'ग्रामपंचायत सदस्य',
  ];

  XFile? _officerPhoto;
  String? _selectedPost;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final XFile? photo = await _imagePicker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1200,
    );

    if (photo != null&&mounted) {
      setState(() {

        _officerPhoto = photo;

      });
    }
  }

  Future<void> _showPhotoSourceSheet() async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'अधिकाऱ्याचा फोटो जोडा',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text('फोटो कॅमेरातून घ्या किंवा गॅलरीतून निवडा.'),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('कॅमेरा'),
                onTap: () {
                  Navigator.pop(context);
                  _pickPhoto(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('गॅलरी'),
                onTap: () {
                  Navigator.pop(context);
                  _pickPhoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _fieldDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: const Color(0xffF8FAF8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xffDCE6DC)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xff237A3B), width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xff237A3B);

    return Scaffold(
      appBar: const CustomAppBar(title: 'नवीन पदाधिकारी जोडा'),
      body: SafeArea(
        top: false,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            children: [
              const Text(
                'पदाधिकारी माहिती',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 6),

              const Text(
                'अधिकाऱ्याचे तपशील आणि फोटो भरा.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 112,
                          height: 112,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffEAF5EC),
                            border: Border.all(color: green, width: 2),
                            image: _officerPhoto == null
                                ? null
                                : DecorationImage(
                                    image: NetworkImage(_officerPhoto!.path),//,FileImage(File(_officerPhoto!.path)),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          child: _officerPhoto == null
                              ? const Icon(Icons.person_outline, size: 52, color: green)
                              : null,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Material(
                            color: green,
                            shape: const CircleBorder(),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: _showPhotoSourceSheet,
                              child: const Padding(
                                padding: EdgeInsets.all(9),
                                child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Color(0xffE1EAE2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: _fieldDecoration(
                          label: 'पदाधिकाऱ्याचे नाव',
                          hint: 'पूर्ण नाव टाका',
                          icon: Icons.person_outline,
                        ),
                        validator: (value) => value == null || value.trim().isEmpty
                            ? 'कृपया नाव टाका'
                            : null,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: _fieldDecoration(
                          label: 'मोबाईल नंबर',
                          hint: '10 अंकी मोबाइल नंबर टाका',
                          icon: Icons.phone_outlined,
                        ).copyWith(counterText: ''),
                        validator: (value) {
                          if (value == null || value.trim().length != 10) {
                            return 'कृपया 10 अंकी मोबाइल नंबर टाका';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        value: _selectedPost,
                        isExpanded: true,
                        decoration: _fieldDecoration(
                          label: 'पद',
                          hint: 'पद निवडा',
                          icon: Icons.badge_outlined,
                        ),
                        items: _posts
                            .map((post) => DropdownMenuItem(
                                  value: post,
                                  child: Text(post),
                                ))
                            .toList(),
                        onChanged: (value) => setState(() => _selectedPost = value),
                        validator: (value) => value == null ? 'कृपया पद निवडा' : null,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 54,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save the officer details and _officerPhoto in the data layer.
                    }
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('सेव्ह करा', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
