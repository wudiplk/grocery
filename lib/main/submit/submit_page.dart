import 'package:flutter/material.dart';
import 'package:grocery/main/home/home_model.dart';
import 'package:grocery/widget/temp_data.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../base/base_state.dart';
import '../../base/base_stateful_widget.dart';
import '../../widget/flutter_utils.dart';
import '../home/home_view_model.dart';

class SubmitPage extends BaseStatefulWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SubmitPageState();
  }
}

class _SubmitPageState extends BaseState<SubmitPage, HomeViewModel> {
  late TextEditingController _nameController;
  late TextEditingController _urlController;
  late TextEditingController _describeController;
  late TextEditingController _classifyController;
  late TextEditingController _keyController;
  late TextEditingController _introduceController;

  String _name = '';
  String _url = '';
  String _describe = '';
  String _classify = '选择分类*';
  String _key = '';
  String _introduce = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController()
      ..addListener(() {
        _name = _nameController.text;
      });
    _describeController = TextEditingController()
      ..addListener(() {
        _describe = _describeController.text;
      });
    _urlController = TextEditingController()
      ..addListener(() {
        _url = _urlController.text;
      });
    _classifyController = TextEditingController()
      ..addListener(() {
        _classify = _classifyController.text;
      });
    _keyController = TextEditingController()
      ..addListener(() {
        _key = _keyController.text;
      });
    _introduceController = TextEditingController()
      ..addListener(() {
        _introduce = _introduceController.text;
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
      ],
      child: Scaffold(
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
                        buildContent(context)
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
      ),
    );
  }

  Widget buildContent(BuildContext buildContext) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.px_4)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Insets.px_8),
                  margin: const EdgeInsets.only(
                      right: Insets.px_4, top: Insets.px_16),
                  height: Insets.px_38,
                  child: TextField(
                    controller: _nameController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0, left: 0),
                      hintText: '网站名称*',
                      hintMaxLines: 1,
                      icon: Icon(Icons.web),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.px_4)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Insets.px_8),
                  margin: const EdgeInsets.only(
                      left: Insets.px_4, top: Insets.px_16),
                  height: Insets.px_38,
                  child: TextField(
                    controller: _urlController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0, left: 0),
                      hintText: '网站链接',
                      hintMaxLines: 1,
                      icon: Icon(Icons.link),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
        Row(
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.px_4)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Insets.px_8),
                  margin: const EdgeInsets.only(
                      right: Insets.px_4, top: Insets.px_16),
                  height: Insets.px_38,
                  child: TextField(
                    controller: _describeController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0, left: 0),
                      hintText: '网站描述*',
                      hintMaxLines: 1,
                      icon: Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Insets.px_4)),
                  ),
                  margin: const EdgeInsets.only(
                      left: Insets.px_4, top: Insets.px_16),
                  height: Insets.px_38,
                  child: Consumer<HomeViewModel>(
                    builder: (buildContext, HomeViewModel homeViewModel, _) =>
                        DropdownButton(
                      underline: Container(height: 0),
                      elevation: 0,
                      focusColor: Colors.grey.withOpacity(0.2),
                      hint: Padding(
                        padding: const EdgeInsets.only(left: Insets.px_8),
                        child: Text(_classify),
                      ),
                      isExpanded: true,
                      items: homeViewModel.model.webEntity.body.map((e) {
                        return DropdownMenuItem(
                          child: Text(e.webTitle),
                          value: e.webTitle,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _classify = value!;
                        });
                      },
                    ),
                  ),
                )),
          ],
        ),
        Container(
          alignment: Alignment.center,
          margin:
              const EdgeInsets.only(top: Insets.px_16, bottom: Insets.px_16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(Insets.px_4)),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: Insets.px_8),
          height: Insets.px_38,
          child: TextField(
            controller: _keyController,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.url,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: 0, left: 0),
              hintText: '网站关键字*',
              hintMaxLines: 1,
              icon: Icon(Icons.star),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '网站介绍：',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: Insets.px_16),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: Insets.px_16, bottom: Insets.px_16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(Insets.px_4)),
          ),
          width: double.infinity,
          height: 200,
          child: TextField(
            controller: _introduceController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: Insets.px_8),
        ),
        Container(
          height: Insets.px_38,
          width: 200,
          margin: const EdgeInsets.only(bottom: Insets.px_64),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              '提交',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Insets.px_4),
                ),
              ),
            ),
          ),
        )
      ],
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
