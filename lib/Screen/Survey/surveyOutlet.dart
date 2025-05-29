import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurveyOutletScreen extends StatefulWidget {
  const SurveyOutletScreen({super.key});

  @override
  State<SurveyOutletScreen> createState() => _SurveyOutletScreenState();
}

class _SurveyOutletScreenState extends State<SurveyOutletScreen> {
  final List<Map<String, dynamic>> surveyHistory = [
    {'date': '2025-05-25', 'score': 85, 'status': 'Completed'},
    {'date': '2025-05-20', 'score': 90, 'status': 'Completed'},
    {'date': '2025-05-15', 'score': 78, 'status': 'Missed'},
  ];

  final List<Map<String, dynamic>> outletRanking = [
    {'name': 'Outlet A', 'score': 95},
    {'name': 'Outlet B', 'score': 91},
    {'name': 'Outlet C', 'score': 89},
    {'name': 'Your Outlet', 'score': 85},
    {'name': 'Outlet D', 'score': 80},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 160.h,
            backgroundColor: Colors.white30,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.teal,
                padding: EdgeInsets.fromLTRB(16.w, 80.h, 16.w, 16.h),
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back 👋",
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Zahed's Outlet",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Survey Summary
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Survey Summary",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _SummaryItem(label: "Completed", value: "12"),
                          _SummaryItem(label: "Avg. Score", value: "88%"),
                          _SummaryItem(label: "Ranking", value: "#4"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Survey History Title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
              child: Row(
                children: [
                  Icon(Icons.history, color: Colors.indigo, size: 20.w),
                  SizedBox(width: 8.w),
                  Text(
                    "Survey History",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Survey History List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = surveyHistory[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  leading: Icon(
                    Icons.date_range,
                    color: Colors.indigo,
                    size: 20.w,
                  ),
                  title: Text(
                    "Date: ${item['date']}",
                    style: TextStyle(fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    "Status: ${item['status']}",
                    style: TextStyle(fontSize: 12.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    "${item['score']}%",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color:
                          item['score'] >= 80
                              ? Colors.green
                              : Colors.deepOrange,
                    ),
                  ),
                ),
              );
            }, childCount: surveyHistory.length),
          ),

          // Outlet Rankings Title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 8.h),
              child: Row(
                children: [
                  Icon(Icons.leaderboard, color: Colors.indigo, size: 20.w),
                  SizedBox(width: 8.w),
                  Text(
                    "Outlet Rankings",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Outlet Rankings List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final outlet = outletRanking[index];
              final isUserOutlet = outlet['name'] == 'Your Outlet';
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                elevation: 2,
                color: isUserOutlet ? Colors.indigo.shade50 : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  leading: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.indigo,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  title: Text(
                    outlet['name'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight:
                          isUserOutlet ? FontWeight.bold : FontWeight.w500,
                      color: isUserOutlet ? Colors.indigo : Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    "${outlet['score']}%",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }, childCount: outletRanking.length),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryItem({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 13.sp, color: Colors.black54)),
      ],
    );
  }
}
