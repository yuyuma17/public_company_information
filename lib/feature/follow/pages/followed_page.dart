import 'package:flutter/material.dart';

class FollowedPage extends StatelessWidget {
  static const routeName = '/followed';
  const FollowedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('追蹤')),
      body: Container(),
    );
  }
}
