import 'package:flutter/material.dart';
import 'package:kommely/dashboardscreen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CaregiverPreferencesScreen(),
  ));
}

class CaregiverPreferencesScreen extends StatefulWidget {
  const CaregiverPreferencesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaregiverPreferencesScreenState createState() => _CaregiverPreferencesScreenState();
}

class _CaregiverPreferencesScreenState extends State<CaregiverPreferencesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _customPreferenceController = TextEditingController();
  List<String> preferences = [
    "Alzheimer's & Dementia - Progressive memory loss, confusion, and cognitive decline.",
    "Palliative Care - Comfort and quality of life support.",
    "Stroke Recovery - Assistance with mobility and rehabilitation.",
    "Elderly Care - Daily assistance for seniors.",
  ];
  List<String> filteredPreferences = [];
  bool isDropdownVisible = false;

  @override
  void initState() {
    super.initState();
    filteredPreferences = preferences;
  }

  void _filterPreferences(String query) {
    setState(() {
      filteredPreferences = preferences
          .where((preference) => preference.toLowerCase().contains(query.toLowerCase()))
          .toList();
      isDropdownVisible = query.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepIndicator(),
            const SizedBox(height: 16),
            const Text(
              "Select Your Caregiving Preferences",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Select the caregiving types you're interested in. If you're open to all, let us know!",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            _buildLabel("Select Preference"),
            _buildSearchField(),
            if (isDropdownVisible) _buildDropdownList(),
            const SizedBox(height: 16),
            _buildLabel("Others"),
            _buildCustomPreferenceField(),
            const Spacer(),
            _buildCreateAccountButton(),
          ],
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
        _buildStepCircle(2, true),
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
    return Container(width: 30, height: 2, color: Colors.grey[300]);
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      onChanged: _filterPreferences,
      decoration: InputDecoration(
        hintText: "Search Preference",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildDropdownList() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: filteredPreferences
            .map((preference) => ListTile(
                  title: Text(preference),
                  onTap: () {
                    setState(() {
                      _searchController.text = preference;
                      isDropdownVisible = false;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildCustomPreferenceField() {
    return TextField(
      controller: _customPreferenceController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "Enter text here",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
       },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text("Create Account", style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}