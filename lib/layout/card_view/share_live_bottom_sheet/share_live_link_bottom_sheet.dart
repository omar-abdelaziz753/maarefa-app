import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/bloc/live_share_link/live_share_link_cubit.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/toast/toast.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:social_share/social_share.dart';

class ShareLiveLinkBottomSheet extends StatelessWidget {
  const ShareLiveLinkBottomSheet(
      {super.key, required this.type, required this.id, required this.timeId});
  final String type;
  final int id;
  final int? timeId;

  static Future<void> open(
    BuildContext context, {
    required String type,
    required int id,
    required int? timeId,
  }) async {
    return await showModalBottomSheet(
        enableDrag: true,
        isDismissible: true,
        routeSettings: const RouteSettings(name: "/ShareLiveLinkBottomSheet"),
        useRootNavigator: true,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        elevation: 20,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => LiveShareLinkCubit()
              ..getLink(id: id, type: type, timeId: timeId),
            child: ShareLiveLinkBottomSheet(
              id: id,
              timeId: timeId,
              type: type,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Durations.medium3,
      alignment: Alignment.bottomCenter,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * .1,
            maxHeight: MediaQuery.of(context).size.height * .8),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: BlocBuilder<LiveShareLinkCubit, LiveShareLinkState>(
            builder: (context, state) {
              if (state is LiveShareLinkSuccessState) {
                return Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * .1,
                          maxHeight: MediaQuery.of(context).size.height * .8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.link, size: 24.r),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: SelectableText(
                            state.link,
                            maxLines: 10,
                            minLines: 1,
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _Button(
                            icon: Icons.copy,
                            bgColor: mainLightColor,
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: state.link))
                                  .then((_) {
                                showToast(tr("savedToClipboard"));
                              });
                            },
                            text: tr("copy"),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: _Button(
                            icon: Icons.ios_share_outlined,
                            bgColor: Colors.grey[300]!,
                            onTap: () {
                              Share.share(state.link);
                            },
                            text: tr("share"),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is LiveShareLinkFailState) {
                return _FailWidget(
                    onRefresh: () =>
                        BlocProvider.of<LiveShareLinkCubit>(context)
                            .getLink(id: id, type: type, timeId: timeId));
              }
              return _Loadingwidget();
            },
          ),
        ),
      ),
    );
  }
}

class _Loadingwidget extends StatelessWidget {
  const _Loadingwidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.link, size: 24.r),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            tr("genratingLiveJoinLink"),
            style: TextStyles.textView14Bold,
          ),
        ),
        SizedBox(
          height: 15.r,
          width: 15.r,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}

class _FailWidget extends StatelessWidget {
  const _FailWidget({required this.onRefresh});
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onRefresh,
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 24.r),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              tr("failGenratingLiveJoinLink"),
              style: TextStyles.textView14Bold,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Icon(Icons.refresh, size: 24.r),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {required this.text,
      required this.icon,
      required this.onTap,
      required this.bgColor});

  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22.r),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyles.textView14Bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
