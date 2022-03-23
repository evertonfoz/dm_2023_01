import 'package:first_app_dm/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';

const kFormPadding = EdgeInsets.only(top: 8, left: 10, right: 8);

class FormBodyUTFPR extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget child;

  const FormBodyUTFPR({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kFormPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            kSizedBoxFieldsSeparator,
            Text(subTitle),
            kSizedBoxFieldsSeparator,
            child,
          ],
        ),
      ),
    );
  }
}
