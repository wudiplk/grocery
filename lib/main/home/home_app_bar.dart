import 'package:flutter/material.dart';
import 'package:grocery/widget/responsive.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Listener(
            onPointerDown: (PointerEvent p) {
            },
            child: const SizedBox(
              height: 58,
              width: 58,
              child: Icon(Icons.person,color: Colors.white,),
            ),
          ),
          const SizedBox(
            height: 58,
            width: 58,
            child: Icon(Icons.search,color: Colors.white,),
          ),
          Responsive.isSmallScreen(context)? Listener(
            onPointerDown: (PointerEvent p) {
              Scaffold.of(context).openDrawer();
            },
            child: const SizedBox(
              height: 58,
              width: 58,
              child: Icon(Icons.menu,color: Colors.white,),
            ),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
