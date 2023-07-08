import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/search_prefs_cubit.dart';
import '../core/styles/typography.dart';
import '../widgets/touchable_opacity.dart';
import 'classes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          print("TODO new post");
        },
        child: const Icon(CupertinoIcons.add),
      ),
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
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ClassesScreen(), fullscreenDialog: true)),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Logged in as: bob@gmail.com",
                    style: kTitle.copyWith(color: Theme.of(context).colorScheme.onSurface),
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextButton(
                    onPressed: () => print("abc"),
                    child: Text(
                      "Logout",
                      style: kTitle.copyWith(color: Theme.of(context).colorScheme.primary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
