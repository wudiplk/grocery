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
      height: 36,
      decoration:  BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(Insets.padding_18)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositionedDirectional(
              start: _index * 64,
              width: 64,
              height: 32,
              curve: Curves.easeOutCirc,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Insets.padding_16)),
                ),
              ),
              duration: const Duration(milliseconds: 400)),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 64,
                height: 32,
                child: MouseRegion(
                  onEnter: (PointerEnterEvent event) {
                    debugPrint('${event.localPosition.distance}');
                    setState(() {
                      _index = 0;
                    });
                  },
                  child:  Text(
                    " 好好学习",
                    style: TextStyle( color: _index == 0 ? Colors.white : Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: 64,
                height: 32,
                child: MouseRegion(
                  onEnter: (PointerEnterEvent event) {
                    debugPrint('${event.localPosition.distance}');
                    setState(() {
                      _index = 1;
                    });
                  },
                  child:  Text(
                    " 好好学习",
                    style: TextStyle( color: _index == 1 ? Colors.white : Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: 64,
                height: 32,
                child: MouseRegion(
                  onEnter: (PointerEnterEvent event) {
                    debugPrint('${event.localPosition.distance}');
                    setState(() {
                      _index = 2;
                    });
                  },
                  child:  Text(
                    " 好好学习",
                    style: TextStyle(
                        color: _index == 2 ? Colors.white : Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
