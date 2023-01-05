import 'package:flutter/cupertino.dart';

void pushRoute(BuildContext context, Widget widget) {
  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => widget));
}
