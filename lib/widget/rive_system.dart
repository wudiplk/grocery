import 'package:flutter/cupertino.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/main/home/home_view_model.dart';
import 'package:rive/rive.dart';

class RiveSystem extends BaseStatefulWidget {
  bool active = false;

  RiveSystem({Key? key, bool active = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RiveSystem();
  }
}

class _RiveSystem extends BaseState<RiveSystem, HomeViewModel> {
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
    _controller.isActive =true;
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'anim/example.riv',
      controllers: [_controller],
      fit: BoxFit.cover,
      onInit: (_) => setState(() {
        _controller.isActive=true;
      }),
    );
  }

  @override
  void onBuildFinish() {
    // TODO: implement onBuildFinish
  }

  @override
  void onBuildStart() {
    // TODO: implement onBuildStart
  }
}
