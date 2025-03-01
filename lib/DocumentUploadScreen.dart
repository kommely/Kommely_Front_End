import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:kommely/caregivingscreen.dart'; // Import the CaregiverPreferencesScreen

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DocumentUploadScreenState createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  File? passportImage;
  File? policeCertificateImage;
  File? caregiverCertificateImage;

  Future<void> _pickImage(ImageSource source, String type) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (type == 'passport') {
          passportImage = File(pickedFile.path);
        } else if (type == 'police') {
          policeCertificateImage = File(pickedFile.path);
        } else if (type == 'caregiver') {
          caregiverCertificateImage = File(pickedFile.path);
        }
      });
    }
  }

  Widget _buildUploadBox(String title, File? imageFile, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery, type),
          child: Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: imageFile == null
                ? Center(
                    child: Text(
                      "Click to upload image",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                : Image.file(imageFile, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Identity Verification",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "To proceed, we need to verify your identity with official documents.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            _buildUploadBox("Passport", passportImage, "passport"),
            _buildUploadBox("Police Certificate", policeCertificateImage, "police"),
            _buildUploadBox("Caregiver Certificate", caregiverCertificateImage, "caregiver"),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to CaregiverPreferencesScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaregiverPreferencesScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}