import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:pullupfighter/screens/setting.dart';

import '../model/workout_model.dart';

class PullupChart extends StatelessWidget {
  final List<StepPoint> workoutData;

  PullupChart({required this.workoutData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                   // showingIndicators: ,
                    spots: workoutData
                        .map((workout) => FlSpot(workout.x.toDouble(), workout.y.toDouble()))
                    //workout.createdAt.millisecondsSinceEpoch.toDouble() ,workout.stepNumber.toDouble()
                        .toList(),
                    isCurved: true,
                    barWidth: 2,
                    color: Colors.blue,
                    belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
