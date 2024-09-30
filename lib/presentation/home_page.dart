import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mail_list/generated/assets.dart';
import 'package:mail_list/modules/mail/bloc/mail_provider.dart';
import 'package:mail_list/presentation/widgets/app_empty_view.dart';
import 'package:mail_list/presentation/widgets/app_error_view.dart';
import 'package:mail_list/presentation/widgets/app_loading_view.dart';
import 'package:mail_list/presentation/widgets/mail_list_item.dart';
import 'package:mail_list/presentation/widgets/ui_kits.dart';

class HomePage extends HookConsumerWidget with UiKits {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mailState = ref.watch(mailProvider.select((value) => value.mails));
    getMails() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(mailProvider.notifier).getMails();
      });
    }

    useEffect(() {
      getMails();
      return null;
    }, []);
    return Column(
      children: [
        AppBar(
          title: const Text("Mail"),
          actions: [
            IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.assetsMenu)),
            IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.assetsSearch)),
          ],
        ),
        Expanded(child: Center(
          child: Builder(
            builder: (context) {
              return mailState.when(
                onSuccess: (data) {
                  if (data.isEmpty) {
                    return const AppEmptyView(title: "No Emails Available");
                  }
                  var unreadMessages =
                      data.where((element) => !element.read).length;
                  return Column(
                    children: [
                      if (unreadMessages > 0)
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              const Text(
                                "Inbox",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              width(8),
                              Text(
                                "$unreadMessages unread",
                                style: TextStyle(
                                    color: colorScheme(context).primary,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                          child: RefreshIndicator.adaptive(
                        onRefresh: () async {
                          getMails();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                            itemBuilder: (context, index) =>
                                MailListItem(mail: data[index]),
                            separatorBuilder: (context, index) => const Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                            itemCount: data.length),
                      ))
                    ],
                  );
                },
                onError: (message) {
                  return AppErrorView(text: message, onRetry: () => getMails());
                },
                onLoading: () {
                  return const AppLoadingView();
                },
              );
            },
          ),
        )),
        const Divider(color: Color(0xffE0E0E0))
      ],
    );
  }
}
