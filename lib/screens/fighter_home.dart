
import 'package:flutter/material.dart';
import 'package:pullupfighter/screens/setting.dart';

import '../widget/bottom.dart';
import 'pullup_page.dart';
import 'pushup_page.dart';
import 'workout_list.dart';

class FighterPullup extends StatefulWidget {
  const FighterPullup({super.key});

  @override
  State<FighterPullup> createState() => _FighterPullupState();
}

class _FighterPullupState extends State<FighterPullup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: null,
          appBar: AppBar(title: const Text('Fighter Pull Up'), centerTitle: true),
          body:const TabBarView(
            children: [
              PullupPage(),
              WorkoutList(),
              Setting(),
            ],
          ),
          bottomNavigationBar: BottomCustom(),
        ),
      ),
    );
  }
}
