import 'package:flutter/material.dart';
import 'package:mail_list/presentation/widgets/app_button.dart';
import 'package:mail_list/presentation/widgets/ui_kits.dart';

class AppErrorView extends StatelessWidget with UiKits {
  const AppErrorView({
    super.key,
    required this.text,
    this.onRetry,
  });

  final String text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            height(30),
            SizedBox(
              height: (60),
              width: (120),
              child: AppButton(text: "Retry", onPressed: onRetry),
            )
          ]
        ],
      ),
    );
  }
}
