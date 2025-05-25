// import 'dart:io';
// import 'dart:math';

// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:my_academy/widget/logo/logo_lottie/logo_lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';

// import '../../../res/value/color/color.dart';
// import '../../../res/value/dimenssion/dimenssions.dart';
// import '../../../res/value/style/textstyles.dart';
// import '../../../service/network/api/api.dart';
// import '../../../widget/alert/alert_rate.dart';
// import '../../../widget/logo/logo/logo.dart';
// import '../provider_screens/main/main_screen.dart';
// import 'loading_screen.dart';

// class LiveScreen extends StatefulWidget {
//   final String? token, rateType, channelName;
//   final bool isBroadcaster;
//   final int? id, rateId;

//   const LiveScreen({
//     Key? key,
//     this.channelName,
//     this.token,
//     this.rateId,
//     this.rateType,
//     required this.isBroadcaster,
//     this.id,
//   }) : super(key: key);

//   @override
//   LiveScreenState createState() => LiveScreenState();
// }

// class LiveScreenState extends State<LiveScreen> {
//   final _users = <int>[];
//   RtcEngine? _engine;
//   bool muted = false;
//   int? streamId;
//   int? userId;
//   bool screenSharing = false;
//   final String _kDefaultAppGroup = 'io.agora';

//   getUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     const key = 'token';
//     userId = int.parse(prefs.getString(key)!);
//   }

//   @override
//   void dispose() {
//     // clear users
//     _users.clear();
//     // destroy sdk and leave channel
//     _engine!.destroy();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     getUserId();
//     super.initState();
//     // initialize agora sdk
//     initializeAgora();
//     // initAgora(context);
//   }

//   // initAgora(context) async {
//   //   try {
//   //     Map<Permission, PermissionStatus> permission =
//   //         await [Permission.microphone, Permission.camera].request();
//   //     if (permission.values.toList()[0].isGranted &&
//   //         permission.values.toList()[1].isGranted) {
//   //       _engine = await RtcEngine.create(appID);
//   //     } else {}
//   //   } catch (e) {}
//   // }

//   Future<void> initializeAgora() async {
//     await _initAgoraRtcEngine();
//     debugPrint("channel: ${widget.channelName}  token: ${widget.token}");
//     await _engine!.enableVideo();
//     await _engine!.startPreview();
//     await _engine!.setChannelProfile(ChannelProfile.LiveBroadcasting);
//     await _engine!.setClientRole(
//         widget.isBroadcaster ? ClientRole.Broadcaster : ClientRole.Audience);

//     if (widget.isBroadcaster) {
//       streamId = await _engine?.createDataStream(false, false);
//     }

//     _engine!.setEventHandler(RtcEngineEventHandler(
//       joinChannelSuccess: (channel, uid, elapsed) {
//         setState(() {
//           debugPrint('onJoinChannel: $channel, uid: $uid');
//         });
//       },
//       leaveChannel: (stats) {
//         setState(() {
//           debugPrint('onLeaveChannel');
//           _users.clear();
//         });
//       },
//       userJoined: (uid, elapsed) {
//         setState(() {
//           debugPrint('userJoined: $uid');

//           _users.add(uid);
//         });
//       },
//       userOffline: (uid, elapsed) {
//         setState(() {
//           debugPrint('userOffline: $uid');
//           _users.remove(uid);
//         });
//       },
//       streamMessage: (_, __, message) {
//         final String info = "here is the message $message";
//         debugPrint(info);
//       },
//       streamMessageError: (_, __, error, ___, ____) {
//         final String info = "here is the error $error";
//         debugPrint(info);
//       },
//     ));

//     await _engine!.registerMediaMetadataObserver();
//     await _engine!.joinChannel(widget.token!, widget.channelName!, null, 0);
//   }

//   Future<void> _initAgoraRtcEngine() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.microphone,
//       Permission.camera,
//       //add more permission to request here.
//     ].request();

//     debugPrint(statuses.toString());

//     _engine = await RtcEngine.create(
//       appID,
//     );
//     await _engine!.enableVideo();
//     await _engine!.enableAudio();

//     await _engine!.setChannelProfile(ChannelProfile.LiveBroadcasting);
//     if (widget.isBroadcaster) {
//       await _engine!.setClientRole(ClientRole.Broadcaster);
//     } else {
//       await _engine!.setClientRole(ClientRole.Audience);
//     }
//     await _engine!.registerMediaMetadataObserver();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         body: Center(
//           child: Stack(
//             children: <Widget>[
//               _broadcastView(),
//               _toolbar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _toolbar() {
//     return widget.isBroadcaster
//         ? Container(
//             alignment: Alignment.bottomCenter,
//             padding: const EdgeInsets.symmetric(vertical: 48),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RawMaterialButton(
//                   onPressed: _onToggleMute,
//                   shape: const CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: muted ? mainColor : white,
//                   padding: const EdgeInsets.all(12.0),
//                   child: Icon(
//                     muted ? Icons.mic_off : Icons.mic,
//                     color: muted ? white : mainColor,
//                     size: 20.0,
//                   ),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () => _onCallEnd(context),
//                   shape: const CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: Colors.redAccent,
//                   padding: const EdgeInsets.all(15.0),
//                   child: const Icon(
//                     Icons.call_end,
//                     color: white,
//                     size: 35.0,
//                   ),
//                 ),
//                 RawMaterialButton(
//                   onPressed: _startShare,
//                   shape: const CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: screenSharing ? Colors.green : white,
//                   padding: const EdgeInsets.all(20.0),
//                   child: Icon(
//                     Icons.screenshot_monitor,
//                     color: screenSharing ? white : Colors.green,
//                     size: 20.0,
//                   ),
//                 ),
//                 RawMaterialButton(
//                   onPressed: _onSwitchCamera,
//                   shape: const CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: white,
//                   padding: const EdgeInsets.all(12.0),
//                   child: const Icon(
//                     Icons.switch_camera,
//                     color: mainColor,
//                     size: 20.0,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             alignment: Alignment.bottomCenter,
//             padding: const EdgeInsets.symmetric(vertical: 48),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RawMaterialButton(
//                   onPressed: () {
//                     _onCallEnd(context);
//                   },
//                   shape: const CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: Colors.redAccent,
//                   padding: const EdgeInsets.all(15.0),
//                   child: const Icon(
//                     Icons.call_end,
//                     color: white,
//                     size: 35.0,
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }

//   /// Helper function to get list of native views
//   _getRenderViews() {
//     final List<StatefulWidget> list = [];
//     if (widget.isBroadcaster) {
//       list.add(const rtc_local_view.SurfaceView());
//     }
//     for (var uid in _users) {
//       list.add(rtc_remote_view.SurfaceView(
//         uid: uid,
//         channelId: widget.channelName!,
//       ));
//     }
//     return list;
//   }

//   /// Video view row wrapper
//   Widget _expandedVideoView(List<Widget> views) {
//     final wrappedViews = views
//         .map<Widget>((view) =>
//             SizedBox(width: screenWidth, height: screenHeight, child: view))
//         .toList();
//     return Expanded(
//       child: Row(
//         children: wrappedViews,
//       ),
//     );
//   }

//   /// Video layout wrapper
//   Widget _broadcastView() {
//     final views = _getRenderViews();
//     switch (views.length) {
//       case 1:
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Logo(
//               logoHeight: 100,
//               logoWidth: 100,
//             ),
//             _expandedVideoView([views[0]])
//           ],
//         );
//       case 2:
//         return Column(
//           children: <Widget>[
//             _expandedVideoView([views[0]]),
//             _expandedVideoView([views[1]])
//           ],
//         );
//       case 3:
//         return Column(
//           children: <Widget>[
//             _expandedVideoView(views.sublist(0, 2)),
//             _expandedVideoView(views.sublist(2, 3))
//           ],
//         );
//       case 4:
//         return Column(
//           children: <Widget>[
//             _expandedVideoView(views.sublist(0, 2)),
//             _expandedVideoView(views.sublist(2, 4))
//           ],
//         );
//       default:
//     }
//     return SizedBox(
//       width: screenWidth,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const LogoLottie(
//             logoHeight: 250,
//             logoWidth: 150,
//           ),
//           Text(
//             tr("wait"),
//             style: TextStyles.appBarStyle,
//           ),
//         ],
//       ),
//     );
//   }

//   void _onCallEnd(BuildContext context) async {
//     if (widget.isBroadcaster == true) {
//       // clear users
//       _users.clear();
//       // destroy sdk and leave channel
//       _engine!.destroy();
//       Get.offAll(() => const ProviderMainScreen());
//     } else {
//       await _engine!.leaveChannel();
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return RateAlert(
//               type: widget.rateType!,
//               id: widget.rateId!,
//             );
//           });
//       // Get.back();
//     }
//   }

//   void _onToggleMute() {
//     setState(() {
//       muted = !muted;
//     });
//     _engine!.muteLocalAudioStream(muted);
//   }

//   void _onSwitchCamera() {
//     // Map<String, dynamic> params = {};
//     // _engine!.enableVideo();
//     // _engine!.enableLocalVideo(true);

//     // _engine!.EnableVideo();
//     // _engine!.enableVideoObserver();
//     // _engine!.enableLocalVideo(false);
//     _engine!.switchCamera();
//   }

//   void _startShare() {
//     if (screenSharing == true) {
//       setState(() {
//         screenSharing = false;
//         _engine!.stopScreenCapture();
//         // initializeAgora();
//         // _engine!.enableLocalVideo(true);
//         // _engine!.enableVideo();
//         // _engine!.startPreview();
//         // _engine!.setChannelProfile(ChannelProfile.LiveBroadcasting);
//         // _engine!.setClientRole(ClientRole.Broadcaster);
//         // _users.clear();
//         // destroy sdk and leave channel
//         // _engine!.destroy();
//         // BlocProvider.of<LiveCubit>(context)
//         //     .enterLive(true, widget.rateId!, widget.rateType!);
//         // await _engine.enableVideo();
//         // await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
//         // await _engine.setClientRole(ClientRole.Broadcaster);
//         Get.offAll(() => LoadingScreen(
//               // channelName: widget.channelName,
//               // token: widget.token,
//               rateId: widget.rateId,
//               rateType: widget.rateType,
//               // id: widget.id,
//               // isBroadcaster: true,
//             ));
//         // Get.offAll(() => LiveScreen(
//         //       channelName: widget.channelName,
//         //       token: widget.token,
//         //       rateId: widget.rateId,
//         //       rateType: widget.rateType,
//         //       id: widget.id,
//         //       isBroadcaster: true,
//         //     ));
//       });
//       setState(() {});
//     } else {
//       setState(() {
//         screenSharing = true;
//         if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
//       const ScreenAudioParameters parametersAudioParams = ScreenAudioParameters(
//         100,
//       );
//       const VideoDimensions videoParamsDimensions = VideoDimensions(
//         width: 1280,
//         height: 720,
//       );
//       const ScreenVideoParameters parametersVideoParams = ScreenVideoParameters(
//         dimensions: videoParamsDimensions,
//         frameRate: 15,
//         bitrate: 1000,
//         contentHint: VideoContentHint.Motion,
//       );
//       const ScreenCaptureParameters2 parameters = ScreenCaptureParameters2(
//         captureAudio: true,
//         audioParams: parametersAudioParams,
//         captureVideo: true,
//         videoParams: parametersVideoParams,
//       );

//         _engine!.startScreenCaptureMobile(parameters);
//     }
//     });
//     }
//   }

//   _startScreenShare() async {
//     final helper = await _engine!.getScreenShareHelper(
//         appGroup: kIsWeb || Platform.isWindows ? null : _kDefaultAppGroup);
//     helper.setEventHandler(RtcEngineEventHandler(
//       joinChannelSuccess: (String channel, int uid, int elapsed) {
//         // logSink.log('ScreenSharing joinChannelSuccess $channel $uid $elapsed');
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content:
//               Text('ScreenSharing joinChannelSuccess $channel $uid $elapsed'),
//         ));
//       },
//       localVideoStateChanged:
//           (LocalVideoStreamState localVideoState, LocalVideoStreamError error) {
//         // logSink.log(
//         //     'ScreenSharing localVideoStateChanged $localVideoState $error');
//         if (error == LocalVideoStreamError.ScreenCaptureWindowClosed) {
//           // _stopScreenShare();
//         }
//       },
//     ));

//     await helper.disableAudio();
//     await helper.enableVideo();
//     await helper.setChannelProfile(ChannelProfile.LiveBroadcasting);
//     await helper.setClientRole(ClientRole.Broadcaster);
//     var windowId = 0;
//     var random = Random();
//     if (!kIsWeb &&
//         (Platform.isWindows || Platform.isMacOS || Platform.isAndroid)) {
//       final windows = _engine!.enumerateWindows();
//       if (windows.isNotEmpty) {
//         final index = random.nextInt(windows.length - 1);
//         // logSink.log('ScreenSharing window with index $index');
//         windowId = windows[index].id;
//       }
//     }
//     await helper.startScreenCaptureByWindowId(windowId);
//     setState(() {
//       screenSharing = true;
//     });
//     await helper.joinChannel(
//         widget.token, widget.channelName!, null, widget.id!);
//   }

//   Future<void> _enableVirtualBackground() async {
//     ByteData data = await rootBundle.load("assets/images/logo.png");
//     List<int> bytes =
//         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     // List<int> bytes =
//     //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String p = path.join(appDocDir.path, 'logo.png');
//     final file = File(p);
//     if (!(await file.exists())) {
//       await file.create();
//       await file.writeAsBytes(bytes);
//     }

//     await _engine!.enableVirtualBackground(
//         true,
//         VirtualBackgroundSource(
//             backgroundSourceType: VirtualBackgroundSourceType.Img, source: p));
//     // setState(() {
//     //   _isEnabledVirtualBackgroundImage = !_isEnabledVirtualBackgroundImage;
//     // });
//   }
// }
