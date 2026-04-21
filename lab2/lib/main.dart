import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _courses = [
  {'title': 'Flutter Basics', 'subtitle': 'Widgets & layouts', 'icon': Icons.phone_android},
  {'title': 'Dart Language', 'subtitle': 'Syntax & OOP', 'icon': Icons.code},
  {'title': 'State Management', 'subtitle': 'Provider & Riverpod', 'icon': Icons.sync_alt},
  {'title': 'Navigation', 'subtitle': 'Routes & deep links', 'icon': Icons.map},
  {'title': 'Networking', 'subtitle': 'REST & HTTP', 'icon': Icons.wifi},
  {'title': 'Firebase', 'subtitle': 'Auth & Firestore', 'icon': Icons.cloud},
  {'title': 'Animations', 'subtitle': 'Implicit & explicit', 'icon': Icons.animation},
  {'title': 'Testing', 'subtitle': 'Unit & widget tests', 'icon': Icons.bug_report},
  {'title': 'Deployment', 'subtitle': 'App Store & Play', 'icon': Icons.rocket_launch},
  {'title': 'UI Design', 'subtitle': 'Material 3', 'icon': Icons.palette},
  {'title': 'Accessibility', 'subtitle': 'Semantics & a11y', 'icon': Icons.accessibility},
  {'title': 'Performance', 'subtitle': 'Profiling & tuning', 'icon': Icons.speed},
];

const _cols = 4;
const _cardW = 150.0;
const _cardH = 160.0;
const _gap = 12.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Courses"),
                centerTitle: true,
                background: Image.asset("assets/seapic.jpg", fit: BoxFit.cover),
              ),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(_gap),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      (_courses.length / _cols).ceil(),
                      (row) => Padding(
                        padding: const EdgeInsets.only(bottom: _gap),
                        child: Row(
                          children: List.generate(_cols, (col) {
                            final i = row * _cols + col;
                            if (i >= _courses.length) return const SizedBox(width: _cardW + _gap);
                            final course = _courses[i];
                            return Padding(
                              padding: const EdgeInsets.only(right: _gap),
                              child: SizedBox(
                                width: _cardW,
                                height: _cardH,
                                child: Card(
                                  color: Colors.purple[50],
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.deepPurpleAccent,
                                          radius: 24,
                                          child: Icon(
                                            course['icon'] as IconData,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          course['title'] as String,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          course['subtitle'] as String,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey[600],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
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
