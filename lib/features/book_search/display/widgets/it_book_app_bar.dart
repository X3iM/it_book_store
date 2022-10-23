import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_book_store/core/utils/constants.dart';

import '../../../../core/widgets/icon_shadow.dart';

class ItBookAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const ItBookAppBar({
    required this.title,
    this.actions,
    this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      leading: leading ?? (ModalRoute.of(context)!.canPop ? _ArrowBack() : null),
      actions: actions,
      title: Text(title, style: Get.textTheme.headline1,),
      // centerTitle: true,
    );
  }

}

class _ArrowBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      splashRadius: radius,
      icon: const IconShadow(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}