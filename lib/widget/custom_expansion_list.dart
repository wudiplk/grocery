import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/com/global.dart';
import 'flutter_utils.dart';

const double _kPanelHeaderCollapsedHeight = 58.0;

class CustomExpansionList extends StatefulWidget {
  CustomExpansionList(
      {Key? key,
      this.children = const <ExpansionPanel>[],
      required this.expansionCallback,
      this.animationDuration = kThemeAnimationDuration})
      : super(key: key);

  List<ExpansionPanel> children=<ExpansionPanel>[];

  ExpansionPanelCallback expansionCallback;

  Duration animationDuration;

  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomExpansionListState();
  }
}

class _CustomExpansionListState extends State<CustomExpansionList> {
  late List<bool> childrenHover;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.children.length, (index) {
        return Container(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          child: Material(
            color:Colors.transparent,
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
      }),
    );
  }

  Widget buildHeader(BuildContext context, int index) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        widget.expansionCallback(index, widget.children[index].isExpanded);
      },
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) {
          setState(() {
            childrenHover[index] = true;
          });
        },
        onExit: (PointerExitEvent event) {
          setState(() {
            childrenHover[index] = false;
          });
        },
        child: SizedBox(
          height: _kPanelHeaderCollapsedHeight,
          child: Container(
            margin: const EdgeInsets.all(Insets.px_6),
            decoration: childrenHover[index]
                ? BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Insets.px_4))
                : const BoxDecoration(),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedContainer(
                    duration: widget.animationDuration,
                    curve: Curves.fastOutSlowIn,
                    margin: EdgeInsets.zero,
                    child: widget.children[index].headerBuilder(
                      context,
                      widget.children[index].isExpanded,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8.0),
                  child: ExpandIcon(
                    color: Global.themeColor,
                    isExpanded: widget._isChildExpanded(index),
                    onPressed: (bool isExpanded) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAmin(int index) {
    return AnimatedCrossFade(
      firstChild: Container(height: 0.0),
      secondChild: widget.children[index].body,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState: widget._isChildExpanded(index)
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: widget.animationDuration,
    );
  }

  @override
  void initState() {
    super.initState();
    childrenHover = List.generate(widget.children.length, (index) => false);
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
