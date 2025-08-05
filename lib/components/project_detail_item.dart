import 'package:flutter/material.dart';

class ProjectDetailItem extends StatelessWidget {
  const ProjectDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 2, fit: FlexFit.tight, child: Icon(icon, size: 24)),
        Flexible(
          flex: 6,
          fit: FlexFit.tight,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Flexible(
          flex: 6,
          fit: FlexFit.tight,
          child: Text(value, style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
