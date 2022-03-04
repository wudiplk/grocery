import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/widget/responsive.dart';
import 'package:grocery/widget/temp_data.dart';

class HomeSubTitle extends StatefulWidget {
  const HomeSubTitle({Key? key}) : super(key: key);

  @override
  _HomeSubTitleState createState() {
    return _HomeSubTitleState();
  }
}

class _HomeSubTitleState extends State<HomeSubTitle> {
  int _index = 0;

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
      margin: const EdgeInsets.only(bottom: Insets.px_12),
      height: Insets.px_40,
      padding: const EdgeInsets.symmetric(horizontal: Insets.px_4),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(Insets.px_40 / 2)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositionedDirectional(
              start: _index * (Insets.px_64 + Insets.px_4 * 2),
              width: Insets.px_64 + Insets.px_4 * 2,
              height: Insets.px_32,
              curve: Curves.easeInOutCubic,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(Insets.px_16)),
                ),
              ),
              duration: const Duration(milliseconds: 250)),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(tempData[0].subTitle.length, (index) {
              return MouseRegion(
                onExit: (PointerExitEvent event) {
                  setState(() {
                    _index = 0;
                  });
                },
                onEnter: (PointerEnterEvent event) {
                  setState(() {
                    _index = index;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: Insets.px_4),
                    alignment: Alignment.center,
                    width: Insets.px_64,
                    height: Insets.px_32,
                    child: Text(
                      tempData[0].subTitle[index],
                      style: TextStyle(
                          color: _index == index ? Colors.white : Colors.grey),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
