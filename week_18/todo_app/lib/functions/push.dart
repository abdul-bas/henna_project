import 'package:flutter/material.dart';

navigatorPush({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
