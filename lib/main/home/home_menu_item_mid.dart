import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/widget/temp_data.dart';
import '../../com/global.dart';
import '../../widget/responsive.dart';

class HomeMenuItemMid extends StatefulWidget {
  late Item item;

  HomeMenuItemMid({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeMenuItemMid();
  }
}

class _HomeMenuItemMid extends State<HomeMenuItemMid> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: Insets.width_58,
      width: Insets.width_58,
      child: MouseRegion(
        onEnter: (PointerEnterEvent event){
          setState(() {
            _isHover = true;
          });
        },
        onExit: (PointerExitEvent event){
          setState(() {
            _isHover =false;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(Insets.px_6),
          decoration: _isHover?BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Insets.px_4)):const BoxDecoration(),
          child: Icon(
            widget.item.iconData,
            color: Global.themeColor,
          ),
        ),
      ),
    );
  }
}
