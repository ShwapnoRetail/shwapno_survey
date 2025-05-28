import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SurveyQuestionScreen extends StatefulWidget {
  const SurveyQuestionScreen({super.key});

  @override
  State<SurveyQuestionScreen> createState() => _SurveyQuestionScreenState();
}

class _SurveyQuestionScreenState extends State<SurveyQuestionScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Is the outlet clean and organized?',
      'category': 'Store Environment',
      'points': 2,
      'requiresImage': false,
      'requiresText': false,
    },
    {
      'question': 'Upload an image of the product display.',
      'category': 'Visual Proof',
      'points': 3,
      'requiresImage': true,
      'requiresText': false,
    },
    {
      'question': 'Was the staff helpful and courteous?',
      'category': 'Customer Service',
      'points': 2,
      'requiresImage': false,
      'requiresText': true,
    },
  ];

  List<String?> answers = [];
  List<File?> images = [];
  List<TextEditingController> textControllers = [];

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    answers = List.filled(questions.length, null);
    images = List.filled(questions.length, null);
    textControllers = List.generate(
      questions.length,
      (index) => TextEditingController(),
    );
  }

  Future<void> pickImage(int index) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  void submitAnswers() {
    for (int i = 0; i < questions.length; i++) {
      print("Q${i + 1}: ${questions[i]['question']}");
      print("Answer: ${answers[i]}");
      if (questions[i]['requiresText']) {
        print("Feedback: ${textControllers[i].text}");
      }
      if (questions[i]['requiresImage']) {
        print("Image path: ${images[i]?.path}");
      }
      print("-----------");
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Survey submitted successfully!')));
  }

  Widget buildQuestionCard(int index) {
    final q = questions[index];

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Survey Category and Points
            Row(
              children: [
                Expanded(
                  child: Text(
                    q['category'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${q['points']} Points',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Question Title
            Text(
              q['question'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 14),

            // Yes/No Toggle
            Row(
              children: [
                ChoiceChip(
                  label: Text('Yes'),
                  selected: answers[index] == 'Yes',
                  onSelected: (_) {
                    setState(() {
                      answers[index] = 'Yes';
                    });
                  },
                  selectedColor: Colors.teal,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color:
                        answers[index] == 'Yes' ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('No'),
                  selected: answers[index] == 'No',
                  onSelected: (_) {
                    setState(() {
                      answers[index] = 'No';
                    });
                  },
                  selectedColor: Colors.redAccent,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: answers[index] == 'No' ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),

            // Image Upload
            if (q['requiresImage']) ...[
              SizedBox(height: 16),
              images[index] == null
                  ? ElevatedButton.icon(
                    icon: Icon(Icons.upload_file),
                    label: Text("Upload Image"),
                    onPressed: () => pickImage(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  )
                  : Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          images[index]!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      TextButton(
                        onPressed: () => pickImage(index),
                        child: Text("Change Image"),
                      ),
                    ],
                  ),
            ],

            // Text Feedback
            if (q['requiresText']) ...[
              SizedBox(height: 16),
              TextField(
                controller: textControllers[index],
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Write your feedback here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                padding: EdgeInsets.only(bottom: 80),
                itemBuilder: (context, index) {
                  return buildQuestionCard(index);
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: ElevatedButton.icon(
                onPressed: submitAnswers,
                icon: Icon(Icons.send),
                label: Text("Submit Survey"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
