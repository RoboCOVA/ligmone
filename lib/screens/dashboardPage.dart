import 'package:flutter/material.dart';
import 'dashboard.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}
