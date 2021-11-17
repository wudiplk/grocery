import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:provider/provider.dart';

import 'good_list_model.dart';

class GoodList extends BaseStatefulWidget {
  const GoodList({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create: (_) => GoodListModel(),
        child: Selector<GoodListModel, GoodListModel>(
          shouldRebuild: (pre, next) => false,
          selector: (context, provider) => provider,
          builder: (context, provider, child) {
            return ListView.builder(
                itemCount: provider.total,
                itemBuilder: (context, index) {
                  return Selector<GoodListModel, Good>(
                    selector: (context, provider) => provider.goodList[index],
                    builder: (context, data, child) {
                      debugPrint(('No.${index + 1} rebuild'));
                      return ListTile(
                        title: Text(data.goodName),
                        trailing: GestureDetector(
                          onTap: () => provider.collect(index),
                          child: Icon(
                              data.isCollect ? Icons.star : Icons.star_border),
                        ),
                      );
                    },
                  );
                });
          },
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
