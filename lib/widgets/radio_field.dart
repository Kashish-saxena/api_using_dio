import 'package:flutter/material.dart';

class RadioFieldWidget extends StatelessWidget {
  const RadioFieldWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 5,
            ),
          ]),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: widget,
    );
  }
}
