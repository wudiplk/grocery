import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class RiveSystem extends StatefulWidget {
  const RiveSystem({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RiveSystem();
  }
}

class _RiveSystem extends State<RiveSystem> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');

  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'anim/bike.riv',
      controllers: [_controller],
      onInit: (_) => setState(() {
        _controller.isActive = true;
      }),
    );
  }
}
