import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../widget/flutter_utils.dart';


class LinkPage extends StatelessWidget {
  const LinkPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
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
          Expanded(
              child: Row(
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
                        Container(
                          margin:
                          const EdgeInsets.only(top:  Insets.px_32,bottom:  Insets.px_18),
                          child: const Text(
                            '简介',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(text: '是一个收集各类网络资源的站点\n'),
                                TextSpan(text: '内容：网站、软件、微信小程序和Chrome插件等\n'),
                                TextSpan(
                                    text:
                                    '原则：把控首页网站质量，不收录内容重复、复制粘贴无特色的站点，保证精而全；并收集有益于用户的软件版本，包括修改版、去广告版、会员版等，如果你使用之后觉得软件不错请在自己的能力范围内支持正版'),
                              ]),
                        ),
                        Container(
                          child: const Text(
                            '致谢',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          margin:
                          const EdgeInsets.only(top:  Insets.px_32,bottom:  Insets.px_18),
                        ),
                        RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                      '内容来源网络搜集，它们大部分来自百度和谷歌等搜索引擎、微博、豆瓣、知乎以及酷安、手机乐园、吾爱破解、windows-apps-that-amaze-us、聚BT、阿虚同学的储物间或龙轩导航等导航网站'),
                                ])),
                        Container(
                          child: const Text(
                            '联系',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          margin:
                          const EdgeInsets.only(top:  Insets.px_32,bottom:  Insets.px_18),
                        ),
                        RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(text: '广告合作联系QQ：837457440，非合作的小伙伴有问题请留言'),
                                ])),
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
              ))
        ],
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
}
