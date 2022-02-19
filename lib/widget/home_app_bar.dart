import 'package:flutter/material.dart';
import 'package:grocery/com/global.dart';
import 'package:grocery/widget/responsive.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Responsive().getResponsiveValue(
                context: context,
                forLargeScreen: Container(
                  color: Colors.white,
                  width: 220,
                  height: 58,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.pets,
                          size: Insets.extraLarge, color: Global.themeColor),
                      Text(
                        '杂货铺',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyles.h1,
                      )
                    ],
                  ),
                ),
                forMediumScreen: Container(
                  height: Insets.superLarge,
                  width: Insets.superLarge,
                  alignment: Alignment.center,
                  child: Icon(Icons.pets, color: Global.themeColor),
                ),
                forShortScreen: Listener(
                  onPointerDown: (PointerEvent p) {
                    if (scaffoldKey.currentState!.isDrawerOpen) {
                      Navigator.pop(context);
                    }else{
                      scaffoldKey.currentState?.openDrawer();
                    }
                  },
                  child: Container(
                      width: Insets.superLarge,
                      height: Insets.superLarge,
                      alignment: Alignment.center,
                      child: Icon(Icons.menu, color: Global.themeColor)),
                )),
            Row(
              children: const [
                SizedBox(
                  height: 58,
                  width: 58,
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  height: 58,
                  width: 58,
                  child: Icon(Icons.search),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
