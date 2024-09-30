import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mail_list/modules/mail/models/mail.dart';
import 'package:mail_list/presentation/widgets/app_fade_image.dart';
import 'package:mail_list/presentation/widgets/ui_kits.dart';

class MailListItem extends StatelessWidget with UiKits {
  const MailListItem({super.key, required this.mail});

  final Mail mail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffE2E8F0)),
                alignment: Alignment.center,
                child: Builder(builder: (context) {
                  var initials = Text(
                    "${mail.firstName.characters.first}${mail.lastName?.characters.firstOrNull ?? ""}",
                    style: const TextStyle(color: Color(0xff73839B)),
                  );
                  if (mail.imageUrl == null || mail.imageUrl?.isEmpty == true) {
                    return initials;
                  } else {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: AppFadeImage(
                          image: mail.imageUrl,
                          placeholder: initials,
                        ));
                  }
                }),
              ),
              width(12),
              Expanded(
                child: Text("${mail.firstName} ${mail.lastName}",
                    style: textTheme(context)
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500)),
              ),
              width(12),
              Text(DateFormat("hh:mma").format(DateTime.now()).toUpperCase())
            ],
          ),
          height(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HookBuilder(builder: (context) {
                final checked = useState<bool?>(mail.read);
                return Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: Checkbox(
                      value: checked.value,
                      visualDensity: VisualDensity.compact,
                      side: BorderSide(color: colorScheme(context).outline),
                      onChanged: (value) {
                        // checked.value = value;
                      },
                    ),
                  ),
                );
              }),
              width(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mail.subject,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff222222),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    height(8),
                    Text(
                      mail.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
