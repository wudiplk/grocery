import 'package:flutter/material.dart';


class LinkPage extends StatelessWidget {
  const LinkPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text('${ModalRoute.of(context)?.settings.arguments}'),
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
