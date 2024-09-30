import 'package:flutter/material.dart';
import 'package:mail_list/presentation/widgets/app_button.dart';
import 'package:mail_list/presentation/widgets/ui_kits.dart';

class AppEmptyView extends StatelessWidget with UiKits {
  final String? actionTitle;
  final VoidCallback? onActionTap;
  final String title;
  final String? subTitle;

  const AppEmptyView(
      {super.key,
      this.actionTitle,
      this.onActionTap,
      required this.title,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          if (subTitle != null) ...[
            height(10),
            Text(
              subTitle!,
              textAlign: TextAlign.center,
            ),
          ],
          height(30),
          if (actionTitle != null)
            SizedBox(
              width: (180),
              height: (60),
              child: AppButton(
                text: actionTitle!,
                onPressed: onActionTap,
              ),
            )
        ],
      ),
    );
  }
}
