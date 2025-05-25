import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:my_academy/layout/activity/user_screens/bank_account/adding_bank_account_screen.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/res/value/style/textstyles.dart';

import '../../../../bloc/bank_account/bank_account_cubit.dart';
import '../../../../model/provider/bank_account/bank_account_model.dart';
import '../../../../repository/provider/bank_account/bank_account_repository.dart';
import '../../../../res/drawable/image/images.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import 'adding_bank_account_screen.dart';

class BankAccount extends StatelessWidget {
  final double balance;
  final String appRatio;
  final double deservedAmount;
  final BankAccountModel? bankData;
  const BankAccount({
    super.key,
    required this.balance,
    required this.bankData,
    required this.appRatio,
    required this.deservedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            BankAccountCubit(BankAccountRepository()),
        child: BlocBuilder<BankAccountCubit, BankAccountState>(
            builder: (context, state) {
          final bloc = BankAccountCubit.get(context);
          return Stack(
            alignment: FractionalOffset.topCenter,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Image.asset(
                  staticBackground,
                  fit: BoxFit.fill,
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: DefaultAppBar(title: tr("bank_account")),
                body: SidePadding(
                  sidePadding: 20,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(wallet), fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      Text(
                        tr("paid_info"),
                        style: TextStyles.appBarStyle
                            .copyWith(color: black, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(tr("amount_found"),
                                      style: TextStyles.headerStyle.copyWith(
                                          color: grey, fontSize: 18.sp)),
                                  Row(children: [
                                    Text(balance.toString(),
                                        style: TextStyles.headerStyle.copyWith(
                                          color: black,
                                          fontSize: 18.sp,
                                        )),
                                    Text(tr("sar"),
                                        style: TextStyles.headerStyle.copyWith(
                                          color: black,
                                          fontSize: 18.sp,
                                        )),
                                  ])
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(tr("app_ratio"),
                                      style: TextStyles.headerStyle.copyWith(
                                          color: grey, fontSize: 18.sp)),
                                  Text(appRatio.toString(),
                                      style: TextStyles.headerStyle.copyWith(
                                        color: black,
                                        fontSize: 18.sp,
                                      )),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(tr("deserved_amount"),
                                      style: TextStyles.headerStyle.copyWith(
                                          color: grey, fontSize: 18.sp)),
                                  Row(children: [
                                    Text(deservedAmount.toString(),
                                        style: TextStyles.headerStyle.copyWith(
                                          color: black,
                                          fontSize: 18.sp,
                                        )),
                                    Text(tr("sar"),
                                        style: TextStyles.headerStyle.copyWith(
                                          color: black,
                                          fontSize: 18.sp,
                                        )),
                                  ])
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(tr("bank_account"),
                          style: TextStyles.appBarStyle
                              .copyWith(color: black, fontSize: 16)),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => Get.to(() => const AddingBankAccount()),
                        child: Stack(
                            alignment: Get.locale!.languageCode == "ar"
                                ? FractionalOffset.topLeft
                                : FractionalOffset.topRight,
                            children: [
                              bankData == null
                                  ? const SizedBox()
                                  : SizedBox(
                                      width: screenWidth,
                                      child: SidePadding(
                                        sidePadding: 15,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.edit,
                                                  size: 15.h, color: grey),
                                              Text(
                                                tr("edit_bank"),
                                                style: TextStyles.appBarStyle
                                                    .copyWith(
                                                        color: grey,
                                                        fontSize: 10),
                                              ),
                                            ]),
                                      ),
                                    ),
                              Container(
                                width: screenWidth,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: mainColor.withOpacity(0.1),
                                ),
                                child: bankData != null
                                    ? SidePadding(
                                        sidePadding: 15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              bankData!.bankName.toString(),
                                              style: TextStyles.appBarStyle
                                                  .copyWith(
                                                      color: mainColor,
                                                      fontSize: 12),
                                            ),
                                            Text(
                                              bankData!.iban.toString(),
                                              style: TextStyles.appBarStyle
                                                  .copyWith(
                                                      color: mainColor,
                                                      fontSize: 12),
                                            ),
                                            Text(
                                              bankData!.address.toString(),
                                              style: TextStyles.appBarStyle
                                                  .copyWith(
                                                      color: mainColor,
                                                      fontSize: 12),
                                            ),
                                          ],
                                        ))
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(plusIcon, color: grey),
                                          Text(
                                            tr("add_bank"),
                                            style: TextStyles.appBarStyle
                                                .copyWith(
                                                    color: grey, fontSize: 16),
                                          ),
                                        ],
                                      ),
                              ),
                            ]),
                      ),
                      const Space(
                        boxHeight: 40,
                      ),
                      MasterLoadButton(
                        buttonController: bloc.addController,
                        // buttonStyle:
                        //     TextStyles.appBarStyle.copyWith(color: mainColor),
                        buttonText: tr("reckoning"),
                        onPressed: () => bloc.requestPay(),
                      ),
                      const Space(
                        boxHeight: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
