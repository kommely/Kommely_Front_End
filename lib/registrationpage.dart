import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:kommely/DocumentUploadScreen.dart';

void main() {
  runApp(RegistrationPage() as Widget);
}

class RegistrationPage {
}

class Registrationpage extends StatelessWidget {
  const Registrationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CaregiverRegistrationScreen(),
    );
  }
}

class CaregiverRegistrationScreen extends StatefulWidget {
  const CaregiverRegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaregiverRegistrationScreenState createState() => _CaregiverRegistrationScreenState();
}

class _CaregiverRegistrationScreenState extends State<CaregiverRegistrationScreen> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  String countryCode = "+234";

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2004, 5, 12), // Default date
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = DateFormat('dd, MMM yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStepIndicator(),
              const SizedBox(height: 16),
              const Text(
                "Create your Caregiver account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please provide the necessary details to help us verify your identity.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              _buildLabel("First & Last Name"),
              Row(
                children: [
                  Expanded(child: _buildTextField("First Name", _firstNameController)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField("Last Name", _lastNameController)),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Enter your full legal name as it appears on your ID.", style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 16),
              _buildLabel("Date of Birth"),
              _buildDateField(),
              const SizedBox(height: 16),
              _buildLabel("Phone Number"),
              _buildPhoneField(),
              const SizedBox(height: 16),
              _buildLabel("Address"),
              _buildTextField("Street Address", _streetController),
              const SizedBox(height: 8),
              _buildTextField("City", _cityController),
              const SizedBox(height: 8),
              _buildTextField("Postal Code", _postalCodeController),
              const SizedBox(height: 8),
              _buildTextField("Country", _countryController),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => const DocumentUploadScreen()),
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepCircle(1, true),
        _buildStepLine(),
        _buildStepCircle(2, false),
        _buildStepLine(),
        _buildStepCircle(3, false),
      ],
    );
  }

  Widget _buildStepCircle(int step, bool isActive) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey[300],
      ),
      child: Center(
        child: Text(
          "$step",
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStepLine() {
    return Container(
      width: 30,
      height: 2,
      color: Colors.grey[300],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextField(
          controller: _dobController,
          decoration: InputDecoration(
            hintText: "12, May 2004",
            suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[600]),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        CountryCodePicker(
          onChanged: (code) {
            setState(() {
              countryCode = code.dialCode!;
            });
          },
          initialSelection: 'NG',
          favorite: ['+234', 'NG'],
          showFlag: false,
          textStyle: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildTextField("Phone Number", _phoneController),
        ),
      ],
    );
  }
}