import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/drawable/icon/icons.dart';
import '../res/value/color/color.dart';
import '../res/value/dimenssion/dimenssions.dart';
import 'image_handler/image_from_network/network_image.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {super.key,
      this.img,
      required this.isEdited,
      this.onTap,
      this.picked = false,
      this.image});
  final String? img;
  final File? image;
  final bool isEdited, picked;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180.h,
          width: 150.w,
        ),
        // Center(
        //   child: Container(
        //     height: 150.h,
        //     width: 150.w,
        //     clipBehavior: Clip.antiAliasWithSaveLayer,
        //     decoration:
        //         BoxDecoration(gradient: blueGradient, shape: BoxShape.circle),
        //     child: 
            Center(
              child: Container(
                height: 120.h,
                width: 120.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    const BoxDecoration(color: white, shape: BoxShape.circle),
                child: Center(
                    child: picked == false
                        ? CachedImage(imageUrl: img ?? "", fit: BoxFit.contain)
                        : Image.file(image!, fit: BoxFit.contain)),
              ),
            ),
        //   ),
        // ),
        isEdited == true
            ? Positioned(
                bottom: 0,
                left: screenWidth / 2 + 20,
                width: 60,
                child: GestureDetector(
                    onTap: onTap, child: Image.asset(editAvater)))
            : const SizedBox(),
        // Positioned(height: 210,width: 60,child: Image.asset(isEdited==false?'':editAvater))
      ],
    );
  }
}
