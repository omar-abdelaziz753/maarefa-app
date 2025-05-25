import 'package:fluttertoast/fluttertoast.dart';

import '../../res/value/color/color.dart';

showToast(String? message) {
  Fluttertoast.showToast(
      backgroundColor: black,
      textColor: white,
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2);
}
