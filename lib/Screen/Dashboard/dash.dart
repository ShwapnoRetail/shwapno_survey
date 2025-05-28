import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? selectedOutlet;
  String? selectedSurveyType;
  final List<String> outlets = ['Outlet A', 'Outlet B', 'Outlet C'];
  final List<String> surveyTypes = ['Regular', 'Special', 'Quick'];
  final TextEditingController dutyManagerController = TextEditingController();

  bool isZonalManager = false; // This will be fetched/set from backend logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.teal,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/shwapno.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Survey Info Cards
            Row(
              children: [
                _infoCard(
                  title: 'Survey Name',
                  value: 'Customer Feedback Survey',
                ),
                const SizedBox(width: 16),
                _infoCard(title: 'Survey Category', value: 'Retail Outlet'),
              ],
            ),
            const SizedBox(height: 24),

            // Outlet Dropdown
            const Text(
              'Select Outlet',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedOutlet,
              isExpanded: true,
              items:
                  outlets
                      .map(
                        (outlet) => DropdownMenuItem(
                          value: outlet,
                          child: Text(outlet),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedOutlet = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Survey Type Selection Box
            const Text(
              'Select Survey Type',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children:
                  surveyTypes.map((type) {
                    final isSelected = selectedSurveyType == type;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSurveyType = type;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.teal : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Text(
                          type,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 24),

            // Duty Manager Field (shown only if not zonal manager)
            if (!isZonalManager) ...[
              const Text(
                'Duty Manager Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: dutyManagerController,
                decoration: InputDecoration(
                  hintText: 'Enter duty manager name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Survey data submitted.")),
                  );
                },
                icon: const Icon(Icons.check_circle),
                label: const Text('Submit Survey'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required String value}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.teal),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
