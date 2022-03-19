import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../widget/flutter_utils.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: const RiveAnimation.asset(
                'anim/about/sun.riv',
                fit: BoxFit.cover,
              ),
              height: Responsive.isSmallScreen(context)
                  ? Insets.width_260
                  : Insets.width_360,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(),
                  fit: FlexFit.tight,
                  flex: 1,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          '${ModalRoute.of(context)?.settings.arguments}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                        margin: const EdgeInsets.only(top: Insets.px_38),
                      ),
                      buildContent(),
                    ],
                  ),
                  flex: 3,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(),
                  flex: 1,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '返回',
        child: const Icon(
          Icons.replay,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              const Text(
                '友链申请提示',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: Insets.px_24,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: Insets.px_16),
                child: Divider(
                  height: Insets.px_8,
                  color: Colors.red,
                  indent: Insets.px_12,
                  endIndent: Insets.px_12,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: Insets.px_12),
                alignment: Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.black
                    ),
                    children: [
                      TextSpan(
                        text: '本站名称：万能收集箱\n',
                      ),
                      TextSpan(
                        text: '本站链接：https://wudiplk.top\n',
                      ),
                      TextSpan(
                        text: '本站描述：跨平台收集哪些有用的东西|万能收集箱\n',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: 0,
            top: Insets.px_16,
            right: Insets.px_16,
            bottom: Insets.px_16,
          ),
          padding: const EdgeInsets.all(
            Insets.px_8,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(Insets.px_8)),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.red,
              width: Insets.px_2,
            ),
          ),
        ),
        Wrap(
          spacing: Insets.px_8,
          runSpacing: Insets.px_4,
          alignment: WrapAlignment.center,
          children: List.generate(10, (index) {
            return const Text('百度导航');
          }),
        )
      ],
    );
  }
}
