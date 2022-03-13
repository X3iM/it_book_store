import 'package:flutter/material.dart';

class PaginateWidget extends StatelessWidget {
  final int currentPage;
  final int maxPage;
  final Function prevPage;
  final Function nextPage;
  final Size size;
  final double? marginTop;

  const PaginateWidget({
    required this.currentPage,
    required this.maxPage,
    required this.prevPage,
    required this.nextPage,
    required this.size,
    this.marginTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      margin: marginTop != null ? EdgeInsets.only(top: marginTop!) : EdgeInsets.zero,
      height: 50,
      width: size.width - 24,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffd2d2d2),
            Color(0xfff5f5f5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              await prevPage();
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: currentPage > 1 ? Colors.black : Colors.grey,
                  size: 14,
                ),
                const SizedBox(width: 8,),
                Text(
                  'PREV',
                  style: TextStyle(
                      color: currentPage > 1 ? Colors.black : Colors.grey,
                      fontSize: 14,
                      fontFamily: 'GothamRounded',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          RichText(
              text: TextSpan(
                  text: '$currentPage',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: ' / $maxPage',
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'GothamRounded',
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ])),
          GestureDetector(
            onTap: () async {
              await nextPage();
            },
            child: Row(
              children: [
                Text(
                  'NEXT',
                  style: TextStyle(
                      color: currentPage < maxPage ? Colors.black : Colors.grey,
                      fontSize: 14,
                      fontFamily: 'GothamRounded',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8,),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: currentPage + 1 < maxPage ? Colors.black : Colors.grey,
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}