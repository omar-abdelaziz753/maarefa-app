import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/value/color/color.dart';

void deleteAlert({VoidCallback? deleteTap}) {
  showCupertinoDialog(
      context: Get.context!,
      builder: (context) => CupertinoAlertDialog(
            title: Text(
              tr("warning"),
              style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
            ),
            content: Text(
              tr("delete_warning"),
              style: GoogleFonts.tajawal(),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  tr("ignore"),
                  style: GoogleFonts.tajawal(color: black),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              CupertinoDialogAction(
                onPressed: deleteTap,
                child: Text(
                  tr("delete"),
                  style: GoogleFonts.tajawal(color: mainColor),
                ),
              ),
            ],
          ));
}
