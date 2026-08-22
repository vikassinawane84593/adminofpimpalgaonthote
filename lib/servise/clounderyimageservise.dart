import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> uploadToCloudinary(XFile officerPhoto) async {
  final url = Uri.parse(
    'https://api.cloudinary.com/v1_1/tzbaeh0q/image/upload',
  );

  final imageBytes = await officerPhoto.readAsBytes();

  final request = http.MultipartRequest(
    'POST',
    url,
  );

  request.fields['upload_preset'] = 'officers';

  request.files.add(
    http.MultipartFile.fromBytes(
      'file',
      imageBytes,
      filename: officerPhoto.name,
    ),
  );

  final response = await request.send();

  final responseBody = await response.stream.bytesToString();

  if (response.statusCode == 200) {
    final data = jsonDecode(responseBody);


    return {
      'url': data['secure_url'],
      'publicId': data['public_id'],
    };


  } else {
    final data = jsonDecode(responseBody);

    throw Exception(

      'Cloudinary upload failed: ${data['error']['message']}',

    );
  }
}