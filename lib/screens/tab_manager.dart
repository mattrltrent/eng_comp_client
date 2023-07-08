import 'package:client/screens/profile.dart';
import 'package:client/screens/feed.dart';
import 'package:client/widgets/themed_status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabManager extends StatefulWidget {
  const TabManager({super.key});

  @override
  State<TabManager> createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> with SingleTickerProviderStateMixin {
  late int currentIndex;
  late TabController tabController;

  @override
  void initState() {
    currentIndex = 0;
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedStatusBar(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: const [
              FeedScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).colorScheme.surface,
            child: SafeArea(
              top: false,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                onTap: (index) {
                  HapticFeedback.lightImpact();
                  setState(() {
                    currentIndex = index;
                  });
                },
                tabs: const [
                  Tab(
                    icon: Icon(CupertinoIcons.square_list),
                  ),
                  Tab(
                    icon: Icon(CupertinoIcons.profile_circled),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
