import 'package:flutter/material.dart';

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
          // AppBar
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 160,
            backgroundColor: Colors.white30,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.teal,
                padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome back 👋",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Zahed's Outlet",
                      style: TextStyle(
                        fontSize: 20,
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
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Survey Summary",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: const [
                  Icon(Icons.history, color: Colors.indigo),
                  SizedBox(width: 8),
                  Text(
                    "Survey History",
                    style: TextStyle(
                      fontSize: 16,
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
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.date_range, color: Colors.indigo),
                  title: Text("Date: ${item['date']}"),
                  subtitle: Text("Status: ${item['status']}"),
                  trailing: Text(
                    "${item['score']}%",
                    style: TextStyle(
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
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Row(
                children: const [
                  Icon(Icons.leaderboard, color: Colors.indigo),
                  SizedBox(width: 8),
                  Text(
                    "Outlet Rankings",
                    style: TextStyle(
                      fontSize: 16,
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
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                elevation: 2,
                color: isUserOutlet ? Colors.indigo.shade50 : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    outlet['name'],
                    style: TextStyle(
                      fontWeight:
                          isUserOutlet ? FontWeight.bold : FontWeight.w500,
                      color: isUserOutlet ? Colors.indigo : Colors.black87,
                    ),
                  ),
                  trailing: Text(
                    "${outlet['score']}%",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }, childCount: outletRanking.length),
          ),

          // Extra Space for Safe Scroll
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }
}
