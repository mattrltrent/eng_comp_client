import 'package:client/core/entities/class.dart';
import 'package:client/widgets/class_code_groups.dart';
import 'package:client/widgets/view_options.dart';
import 'package:flutter/material.dart';

import '../core/styles/typography.dart';
import '../widgets/touchable_opacity.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TouchableOpacity(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.transparent,
                        child: Text(
                          "go back",
                          style: kTitle.copyWith(color: Theme.of(context).colorScheme.onSurface),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // looking for
                    Text(
                      "Looking for",
                      style: kDisplay1.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 20),
                    const ViewOptions(),
                    // matching against
                    const SizedBox(height: 20),
                    Text(
                      "Matching against classes",
                      style: kDisplay1.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 20),
                    ClassCodeGroups(
                      classes: [
                        Class(name: "MATH", code: 100),
                        Class(name: "MATH", code: 100),
                        Class(name: "MATH", code: 100),
                        Class(name: "MATH", code: 100),
                        Class(name: "MATH", code: 100),
                        Class(name: "MATH", code: 100),
                        Class(name: "MATH", code: 100),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
