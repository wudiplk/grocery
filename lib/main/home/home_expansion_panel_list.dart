import 'package:flutter/material.dart';
import 'package:grocery/com/global.dart';

import 'home_expand_icon.dart';

const double _kPanelHeaderCollapsedHeight = 58.0;
const double _kPanelHeaderExpandedHeight = 70.0;

class HomeExpansionPanelList extends StatelessWidget {
  const HomeExpansionPanelList(
      {Key? key,
      this.children = const <ExpansionPanel>[],
      required this.expansionCallback,
      this.animationDuration = kThemeAnimationDuration})
      : super(key: key);

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback expansionCallback;

  final Duration animationDuration;

  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(children.length, (index) {
        return buildExpand(context, index);
      }),
    );
  }

  Widget buildExpand(BuildContext context, int index) {
    return Container(
      key: _SaltedKey<BuildContext, int>(context, index * 2),
      child: Material(
        shadowColor: const Color.fromRGBO(50, 51, 70, 0),
        elevation: 2.0,
        borderOnForeground: false,
        child: Column(
          children: <Widget>[
            buildHeader(context, index),
            buildAmin(index),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, int index) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        expansionCallback(index, children[index].isExpanded);
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.zero,
              child: SizedBox(
                height: _kPanelHeaderCollapsedHeight,
                child: children[index].headerBuilder(
                  context,
                  children[index].isExpanded,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(end: 8.0),
            child: HomeExpandIcon(
              color: Global.themeColor,
              isExpanded: _isChildExpanded(index),
              onPressed: (bool isExpanded) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAmin(int index) {
    return AnimatedCrossFade(
      firstChild: Container(height: 0.0),
      secondChild: children[index].body,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState: _isChildExpanded(index)
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: animationDuration,
    );
  }
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt && value == typedOther.value;
  }

  @override
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}
