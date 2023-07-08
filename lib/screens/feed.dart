import 'package:client/core/cubit/search_prefs_cubit.dart';
import 'package:client/core/entities/class.dart';
import 'package:client/core/entities/post.dart';
import 'package:client/core/router.dart';
import 'package:client/core/styles/typography.dart';
import 'package:client/widgets/post_tile.dart';
import 'package:client/widgets/touchable_opacity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classes.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      lookingForToString((context.watch<SearchPrefsCubit>().state as SearchPrefsInitial).lookingFor),
                      style: kTitle.copyWith(color: Theme.of(context).colorScheme.primary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TouchableOpacity(
                    // onTap: () => router.push("/classes"),
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ClassesScreen())),
                    child: Container(
                      color: Colors.transparent, // transparent hitbox trick
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "edit",
                        style: kTitle.copyWith(color: Theme.of(context).colorScheme.secondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostTile(
                      post: Post(
                        email: "bob@gmail.com",
                        name: "julie",
                        posterType: PosterType.student,
                        allClasses: [Class(name: "MUS", code: 109), Class(name: "CSC", code: 230)],
                        intersectionClasses: [Class(name: "MATH", code: 122)],
                        desc: "i need so much help",
                      ),
                    ),
                    PostTile(
                      post: Post(
                        email: "bob@gmail.com",
                        name: "frank",
                        posterType: PosterType.student,
                        allClasses: [Class(name: "MATH", code: 122)],
                        intersectionClasses: [Class(name: "MATH", code: 122)],
                        desc: "i need so much help",
                      ),
                    ),
                    PostTile(
                      post: Post(
                        email: "bob@gmail.com",
                        name: "bob",
                        posterType: PosterType.student,
                        allClasses: [
                          Class(name: "MATH", code: 122),
                          Class(name: "ECON", code: 103),
                          Class(name: "COM", code: 100),
                          Class(name: "CSC", code: 226)
                        ],
                        intersectionClasses: [Class(name: "MATH", code: 122)],
                        desc: "i need so much help",
                      ),
                    ),
                    PostTile(
                      post: Post(
                        email: "bob@gmail.com",
                        name: "jeff",
                        posterType: PosterType.student,
                        allClasses: [Class(name: "PHYS", code: 233), Class(name: "PHYS", code: 330)],
                        intersectionClasses: [Class(name: "MATH", code: 122)],
                        desc: "i need so much help",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
