import 'package:flutter/material.dart';
import 'package:kommely/JobsDetailsScreen.dart'; // Import Job Details Screen

class AllJobsScreen extends StatelessWidget {
  const AllJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> jobs = [
      {
        "name": "Oliver Finch",
        "gender": "Female",
        "age": "75yrs",
        "condition": "Dementia",
        "mobility": "Mobility-impaired"
      },
      {
        "name": "Liam Carter",
        "gender": "Non-binary",
        "age": "65yrs",
        "condition": "Cognitive decline",
        "mobility": "Assisted mobility"
      },
      {
        "name": "Oliver Finch",
        "gender": "Female",
        "age": "75yrs",
        "condition": "Dementia",
        "mobility": "Mobility-impaired"
      },
      {
        "name": "Liam Carter",
        "gender": "Non-binary",
        "age": "65yrs",
        "condition": "Cognitive decline",
        "mobility": "Assisted mobility"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("All Jobs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            var job = jobs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailsScreen(
                      name: job["name"]!,
                      gender: job["gender"]!,
                      age: job["age"]!,
                      condition: job["condition"]!,
                      mobility: job["mobility"]!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text("${job["gender"]} (${job["age"]})"),
                      Text(job["condition"]!),
                      Text(job["mobility"]!),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}