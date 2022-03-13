import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
            boxShadow: [
              const BoxShadow(
                  offset: Offset(10, 10),
                  color: Colors.black38,
                  blurRadius: 20),
              BoxShadow(
                  offset: const Offset(-10, -10),
                  color: Colors.white.withOpacity(0.85),
                  blurRadius: 20)
            ]),
        child: Material(
            borderRadius: BorderRadius.circular(10),
            color: onTap != null ? null : Colors.transparent,
            child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: child,
                )
            )
        )
    );
  }

}
