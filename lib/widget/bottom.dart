import 'package:flutter/material.dart';

class BottomCustom extends StatelessWidget {
  const BottomCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white, width: 1.0),
      ),
      child: const TabBar(tabs: [
        Tab(
          icon: Icon(Icons.fitness_center),
          text: 'WorkOut',
        ),
        Tab(
          //다이어리에 쉐어할까 ?  해당일 records 를 넘겨주면 될듯.
          icon: Icon(Icons.calendar_month),
          text: 'Diary',
        ),
        Tab(
          icon: Icon(Icons.settings),
          text: 'Setting',
        )
      ]),
    );
  }
}
