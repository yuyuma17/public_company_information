import 'package:flutter/material.dart';

class AllIndustryPage extends StatelessWidget {
  static const routeName = '/all-industry';
  const AllIndustryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('產業別')),
      body: Container(),
    );
  }
}
