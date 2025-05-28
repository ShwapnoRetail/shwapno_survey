import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwapno_survey/Style/style.dart';

class SurveyHomePage extends StatefulWidget {
  const SurveyHomePage({super.key});

  @override
  State<SurveyHomePage> createState() => _SurveyHomePageState();
}

class _SurveyHomePageState extends State<SurveyHomePage> {
  String? selectedOutlet;
  String? dutyManagerName;
  bool isZonalManager = false;

  final List<String> outlets = [
    'Outlet 001 - Dhaka Central',
    'Outlet 002 - Chittagong Branch',
    'Outlet 003 - Sylhet Market',
    'Outlet 004 - Khulna Store',
    'Outlet 005 - Rajshahi Center',
  ];

  final Map<String, List<Map<String, dynamic>>> outletSurveys = {
    'Outlet 001 - Dhaka Central': [
      {
        'name': 'Customer Satisfaction',
        'questions': 15,
        'time': '10-15 mins',
        'progress': 0.4,
      },
      {
        'name': 'Product Availability',
        'questions': 8,
        'time': '5-7 mins',
        'progress': 0.0,
      },
    ],
    'Outlet 002 - Chittagong Branch': [
      {
        'name': 'Staff Behavior',
        'questions': 10,
        'time': '7-10 mins',
        'progress': 0.2,
      },
      {
        'name': 'Billing Experience',
        'questions': 6,
        'time': '4-6 mins',
        'progress': 0.0,
      },
    ],
    'Outlet 003 - Sylhet Market': [
      {
        'name': 'Cleanliness Review',
        'questions': 12,
        'time': '6-8 mins',
        'progress': 0.5,
      },
      {
        'name': 'Product Arrangement',
        'questions': 9,
        'time': '6-9 mins',
        'progress': 0.0,
      },
    ],
    'Outlet 004 - Khulna Store': [
      {
        'name': 'Checkout Feedback',
        'questions': 10,
        'time': '8-10 mins',
        'progress': 0.1,
      },
      {
        'name': 'Offers Evaluation',
        'questions': 7,
        'time': '5-7 mins',
        'progress': 0.0,
      },
    ],
    'Outlet 005 - Rajshahi Center': [
      {
        'name': 'Customer Service Audit',
        'questions': 13,
        'time': '9-11 mins',
        'progress': 0.3,
      },
      {
        'name': 'Feedback on Promotions',
        'questions': 11,
        'time': '7-9 mins',
        'progress': 0.0,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentSurveys =
        selectedOutlet != null ? outletSurveys[selectedOutlet] ?? [] : [];

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Start Your Survey", style: Head6Text(colorDarkBlue)),
            ),
            SizedBox(height: 20.h),

            /// Survey Details Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.assignment, color: Colors.teal, size: 20.w),
                        SizedBox(width: 8.w),
                        Text('Survey Details', style: Head6Text(colorDarkBlue)),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    _buildDetailRow(
                      'Survey Name:',
                      selectedOutlet != null && currentSurveys.isNotEmpty
                          ? currentSurveys.first['name']
                          : 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    _buildDetailRow('Category:', 'Retail Experience'),
                    SizedBox(height: 8.h),
                    _buildDetailRow(
                      'Date:',
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Outlet Selection
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.store, color: Colors.teal, size: 20.w),
                        SizedBox(width: 8.w),
                        Text(
                          'Select Your Outlet',
                          style: Head6Text(colorDarkBlue),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedOutlet,
                        hint: Text(
                          'Choose outlet',
                          style: Head7Text(colorLightGray),
                        ),
                        items:
                            outlets.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Head7Text(colorDarkBlue),
                                ),
                              );
                            }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedOutlet = newValue;
                          });
                        },
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.teal),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Duty Manager Input
            if (!isZonalManager)
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: Colors.teal,
                            size: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          Text('Duty Manager', style: Head6Text(colorDarkBlue)),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter duty manager name',
                          hintStyle: Head7Text(colorLightGray),
                          prefixIcon: Icon(
                            Icons.badge_outlined,
                            color: Colors.teal,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Colors.teal,
                              width: 1.5,
                            ),
                          ),
                        ),
                        style: Head7Text(colorDarkBlue),
                        onChanged:
                            (value) => setState(() => dutyManagerName = value),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 20.h),

            /// Survey List
            if (selectedOutlet != null) ...[
              Text('Available Surveys', style: Head6Text(colorDarkBlue)),
              SizedBox(height: 12.h),
              ...currentSurveys
                  .map((survey) => _buildSurveyCard(survey))
                  .toList(),
            ],

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(label, style: Head7Text(colorLightGray)),
        ),
        SizedBox(width: 8.w),
        Expanded(child: Text(value, style: Head7Text(colorDarkBlue))),
      ],
    );
  }

  Widget _buildSurveyCard(Map<String, dynamic> survey) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  survey['name'],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: colorDarkBlue,
                  ),
                ),
                if (survey['progress'] > 0)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '${(survey['progress'] * 100).toInt()}% completed',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.h),

            /// Info
            Row(
              children: [
                Icon(Icons.help_outline, size: 16.w, color: colorLightGray),
                SizedBox(width: 4.w),
                Text(
                  '${survey['questions']} questions',
                  style: TextStyle(fontSize: 12.sp, color: colorLightGray),
                ),
                SizedBox(width: 12.w),
                Icon(Icons.access_time, size: 16.w, color: colorLightGray),
                SizedBox(width: 4.w),
                Text(
                  survey['time'],
                  style: TextStyle(fontSize: 12.sp, color: colorLightGray),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            /// Progress Bar
            LinearProgressIndicator(
              value: survey['progress'],
              backgroundColor: Colors.grey.shade200,
              color: Colors.teal,
              minHeight: 6.h,
              borderRadius: BorderRadius.circular(3.r),
            ),
            SizedBox(height: 16.h),

            /// Start Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (!isZonalManager &&
                      (dutyManagerName == null || dutyManagerName!.isEmpty)) {
                    ErrorToast('Please enter duty manager name');
                  } else {
                    SuccessToast('Starting ${survey['name']}');
                    // Navigator.push(...);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text('Start Survey', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
