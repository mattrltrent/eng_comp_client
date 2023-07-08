import 'package:client/core/cubit/query_classes_cubit.dart';
import 'package:client/core/entities/class.dart';
import 'package:client/widgets/class_code_groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable/exports.dart';

import '../core/styles/typography.dart';
import '../widgets/expandable_textfield.dart';
import '../widgets/touchable_opacity.dart';

class SearchClassesScreen extends StatefulWidget {
  const SearchClassesScreen({super.key});

  @override
  State<SearchClassesScreen> createState() => _SearchClassesScreenState();
}

class _SearchClassesScreenState extends State<SearchClassesScreen> {
  List<Class> classes = [];

  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                color: Theme.of(context).colorScheme.background,
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
                            "<- done",
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
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ExpandableTextfield(
                      controller: TextEditingController(),
                      onChanged: (text) =>
                          setState(() => classes = context.read<QueryClassesCubit>().searchClasses(text)),
                      hintText: "Search classes...",
                    ),
                    ClassCodeGroups(classes: classes, onRemove: (r) => {}),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
