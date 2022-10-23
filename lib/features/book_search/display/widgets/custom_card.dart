import 'package:flutter/material.dart';
import 'package:it_book_store/core/utils/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CustomCard({
    required this.child,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.grey.shade300,
            boxShadow: [
              const BoxShadow(
                  offset: Offset(10, 10),
                  color: Colors.black38,
                  blurRadius: 20),
              BoxShadow(
                  offset: const Offset(-10, -10),
                  color: Colors.white.withOpacity(0.85),
                  blurRadius: 20),
            ],
        ),
        child: Material(
            borderRadius: BorderRadius.circular(radius),
            color: onTap != null ? null : Colors.transparent,
            child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(radius),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: horizontalPadding),
                  child: child,
                )
            )
        )
    );
  }

}
