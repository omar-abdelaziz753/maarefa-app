// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../bloc/live/live_cubit.dart';
// import '../../../res/value/color/color.dart';
// import '../../../res/value/dimenssion/dimenssions.dart';
// import '../../../widget/loader/loader.dart';

// class LoadingScreen extends StatelessWidget {
//   final int? rateId;
//   final String? rateType;
//   const LoadingScreen({Key? key, this.rateId, this.rateType}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<LiveCubit>(context).enterLive(true, rateId!, rateType!);
//     return Scaffold(
//         backgroundColor: white,
//         body: SizedBox(
//           height: screenHeight,
//           width: screenWidth,
//           child: const Loading(),
//         ));
//   }
// }
