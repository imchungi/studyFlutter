import 'package:flutter/material.dart';

class PushupPage extends StatefulWidget {
  const PushupPage({super.key});

  @override
  State<PushupPage> createState() => _PushupPageState();
}

class _PushupPageState extends State<PushupPage> {
  List<List<int>> pushupNumber = [[]];
  final List<int> start = [5, 4, 3, 2, 1];
  loadData() {
    for (int y = 0; y <= 1000; y++) {
      for (int i = 0; i < start.length; i++) {
        pushupNumber.add(List.from(start));
        start[start.length - 1 - i] = start[start.length - i - 1] + 1;
      }
    }
  }

  List<bool> checkSum = [false, false, false, false, false];

  @override
  void initState() async{
    await loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: pushupNumber.length
                  ,itemBuilder: (context, index){

                    return Text(pushupNumber[index].toString());

                }
                ,),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
