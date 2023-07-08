import 'package:client/core/entities/class.dart';
import 'package:flutter/material.dart';

class ClassCodeGroups extends StatefulWidget {
  const ClassCodeGroups({super.key, required this.classes});

  final List<Class> classes;

  @override
  State<ClassCodeGroups> createState() => _ClassCodeGroupsState();
}

class _ClassCodeGroupsState extends State<ClassCodeGroups> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.classes.map((Class c) {
        return Chip(
          label: Text(c.name),
          onDeleted: () {
            setState(() {
              widget.classes.remove(c);
            });
          },
        );
      }).toList(),
    );
  }
}
