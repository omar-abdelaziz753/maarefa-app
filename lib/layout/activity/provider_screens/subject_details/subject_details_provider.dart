import 'package:flutter/material.dart';
import '../../../../res/value/color/color.dart';
import '../../../../widget/buttons/back/back_button.dart';
import '../../../view/provider_lesson_details/provider_lesson_details_view.dart';

class SubjectDetailsProviderScreen extends StatelessWidget {
  const SubjectDetailsProviderScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        leading: const MasterBackButton(),
      ),
      body: ProviderLessonDetailsView(
        id: id,
      ),
    );
  }
}
