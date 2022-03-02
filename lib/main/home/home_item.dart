import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/widget/responsive.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({Key? key}) : super(key: key);

  @override
  _HomeItemState createState() {
    return _HomeItemState();
  }
}

class _HomeItemState extends State<HomeItem> {
  bool _isHover = false;

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
    return SizedBox(
      height: 42,
      width: 160,
      child: AnimatedAlign(
        alignment: _isHover ? Alignment.topCenter : Alignment.bottomCenter,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 500),
        child: Container(
          height: 36,
          decoration: _isHover
              ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2), blurRadius: 8)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((8)),
                )
              : BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
          width: 160,
          child: MouseRegion(
            onEnter: (PointerEnterEvent event) {
              setState(() {
                _isHover = true;
              });
            },
            onExit: (PointerExitEvent event) {
              setState(() {
                _isHover = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.ac_unit),
                Text("百度"),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
