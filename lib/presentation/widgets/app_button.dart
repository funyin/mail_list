import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mail_list/presentation/widgets/ui_kits.dart';

class AppButton extends StatelessWidget with UiKits {
  final VoidCallback? onPressed;
  final String text;
  final bool loading;

  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: !loading ? onPressed : () {},
      child: !loading
          ? Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          : Center(
              child: FittedBox(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: colorScheme(context).onPrimary,
                  size: 18,
                ),
              ),
            ),
    );
  }
}
