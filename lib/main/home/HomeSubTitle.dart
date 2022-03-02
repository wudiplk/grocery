import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/widget/responsive.dart';

class HomeSubTitle extends StatefulWidget {
  const HomeSubTitle({Key? key}) : super(key: key);

  @override
  _HomeSubTitleState createState() {
    return _HomeSubTitleState();
  }
}

class _HomeSubTitleState extends State<HomeSubTitle> {
  double _Xposition = 0;
  double _YPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(Insets.padding_16)),
      ),
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) {},
        onHover: (PointerHoverEvent event) {
          setState(() {
            _Xposition = event.distance;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(" 好好学习"),
                Text(" 好好学习"),
                Text(" 好好学习"),
              ],
            ),
            AnimatedPositioned(
                left: _Xposition,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Insets.padding_16)),
                  ),
                  child: const Text("好好学习"),
                ),
                duration: const Duration(milliseconds: 500))
          ],
        ),
      ),
    );
  }
}
