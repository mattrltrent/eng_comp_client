import 'package:client/core/entities/class.dart';
import 'package:client/core/styles/typography.dart';
import 'package:client/widgets/touchable_opacity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassCodeGroups extends StatefulWidget {
  const ClassCodeGroups({super.key, required this.classes, required this.onRemove});

  final List<Class> classes;
  final Function(int idxRemoved) onRemove;

  @override
  State<ClassCodeGroups> createState() => _ClassCodeGroupsState();
}

class _ClassCodeGroupsState extends State<ClassCodeGroups> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.classes.asMap().entries.map((entry) {
        final index = entry.key;
        final Class c = entry.value;
        return ClassTile(
          code: c.code,
          text: c.name,
          onTap: () => widget.onRemove(index),
        );
      }).toList(),
    );
  }
}

class ClassTile extends StatelessWidget {
  const ClassTile({
    super.key,
    required this.code,
    required this.text,
    required this.onTap,
  });

  final String text;
  final int code;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: kBody.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              code.toString(),
              style: kBody.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              CupertinoIcons.xmark,
              size: 15,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
