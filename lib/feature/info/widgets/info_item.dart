import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String info;
  final bool hasWidthLimit;

  const InfoItem({
    required this.title,
    required this.info,
    this.hasWidthLimit = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 3.0),
        Text(
          info,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
    return hasWidthLimit ? SizedBox(width: 80.0, child: widget) : widget;
  }
}
