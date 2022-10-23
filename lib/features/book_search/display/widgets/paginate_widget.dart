import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/theme.dart';

class PaginateWidget extends StatelessWidget {
  final int currentPage;
  final int maxPage;
  final Function prevPage;
  final Function nextPage;

  const PaginateWidget({
    required this.currentPage,
    required this.maxPage,
    required this.prevPage,
    required this.nextPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      margin: EdgeInsets.only(top: verticalPadding),
      height: Get.height * .06,
      width: Get.width - 24,
      decoration: ShapeDecoration(
        gradient: primaryGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              prevPage();
            },
            child: FittedBox(
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: currentPage > 1 ? Get.theme.indicatorColor : Get.theme.highlightColor,
                    size: smallIconSize,
                  ),
                  SizedBox(width: smallHorizontalPadding,),
                  Text(
                    'prev'.tr,
                    style: Get.textTheme.bodyText1?.copyWith(
                      color: currentPage > 1 ? Get.theme.indicatorColor : Get.theme.highlightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FittedBox(
            child: RichText(
              text: TextSpan(
                text: '$currentPage',
                style: Get.textTheme.bodyText1,
                children: [
                  TextSpan(text: ' / $maxPage', style: Get.textTheme.bodyText1,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await nextPage();
            },
            child: FittedBox(
              child: Row(
                children: [
                  Text(
                    'next'.tr,
                    style: Get.textTheme.bodyText1?.copyWith(
                      color: currentPage < maxPage ? Get.theme.indicatorColor : Get.theme.highlightColor,
                    ),
                  ),
                  SizedBox(width: smallHorizontalPadding,),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: currentPage + 1 < maxPage ? Get.theme.indicatorColor : Get.theme.highlightColor,
                    size: smallIconSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}