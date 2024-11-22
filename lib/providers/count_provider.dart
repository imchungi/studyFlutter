import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CountdownTimerProvider with ChangeNotifier {
  int _seconds = 30;
  Timer? _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  int get seconds => _seconds;

  bool _isSoundOn = true;
  bool get isSoundOn => _isSoundOn;
  void toggleSound() {
    _isSoundOn = !_isSoundOn;
    notifyListeners();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        _timer!.cancel();
        _playSound();
      }
    });
  }

  void _playSound() async {
    await _audioPlayer.play(AssetSource('note.mp3'));
  }

  void incrementTime() {
    _seconds += 30;
    _startTimer();
    notifyListeners();
  }

  void startTime() {
    _startTimer();
    notifyListeners();
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    _seconds = 30; // 초기화
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}
