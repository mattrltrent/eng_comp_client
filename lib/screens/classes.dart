import 'package:client/core/cubit/search_prefs_cubit.dart';
import 'package:client/screens/search_classes.dart';
import 'package:client/widgets/class_code_groups.dart';
import 'package:client/widgets/view_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<SearchPrefsCubit, SearchPrefsState>(
      builder: (context, state) {
        return Scaffold(
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Matching against classes",
                                style: kDisplay1.copyWith(color: Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TouchableOpacity(
                              onTap: () => Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const SearchClassesScreen())),
                              child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  CupertinoIcons.add,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // todo: make scrollable column
                        const SizedBox(height: 20),
                        (state as SearchPrefsInitial).lookingFor == LookingFor.all
                            ? Text("\"All\" means you match against every class",
                                style: kTitle.copyWith(color: Theme.of(context).colorScheme.onSurface))
                            : state.classes.isEmpty
                                ? Text("No classes selected, add some!",
                                    style: kTitle.copyWith(color: Theme.of(context).colorScheme.onSurface))
                                : ClassCodeGroups(
                                    onRemove: (idxRemoved) => context.read<SearchPrefsCubit>().removeAtIdx(idxRemoved),
                                    classes: state.classes,
                                  ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
