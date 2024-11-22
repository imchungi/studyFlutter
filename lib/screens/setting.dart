import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pullupfighter/model/mode_model.dart';

import '../model/workout_model.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final String _boxName = 'modeBox';

  Future<Box<WorkOut>> get _box async => await Hive.openBox<WorkOut>(_boxName);

  Future<void> addWorkout(WorkOut item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<WorkOut>> getAllWorkout() async {
    var box = await _box;
    return box.values.toList();
  }

  // ModeSetting? modeSetting;
  Box? _modeBox;

  Future<void> _fetchMode() async {
    _modeBox = await Hive.openBox<ModeSetting>('modeBox');
    if (_modeBox!.isEmpty){_modeBox!.addAll(<ModeSetting>
      [
        ModeSetting(modeTitle: 'PullUp', modeStep: 5, modeColor: 0xFF00FF00),
        ModeSetting(modeTitle: 'PushUp', modeStep: 6, modeColor: 0xFF00FF00),
        ModeSetting(modeTitle: 'Squat', modeStep: 200, modeColor: 0xFF00FF00),
      ],
    );}
  }

  @override
  void initState() {
    _fetchMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          children: [
            Text('Athletic List'),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box<ModeSetting>('modeBox').listenable(),
                builder: (context, Box<ModeSetting> box, _) {
                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      final modelist = box.getAt(index);
                      return Card(
                        child: ListTile(
                          title: Text(modelist!.modeTitle),
                          subtitle: Text('Step: ${modelist.modeStep}, Color: ${modelist.modeColor}'),
                          trailing: IconButton(onPressed: (){
                            modelist.delete();
                          }, icon: Icon(Icons.delete)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
