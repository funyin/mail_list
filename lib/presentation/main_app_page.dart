import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mail_list/generated/assets.dart';
import 'package:mail_list/presentation/calendar_page.dart';
import 'package:mail_list/presentation/chat_page.dart';
import 'package:mail_list/presentation/home_page.dart';
import 'package:mail_list/presentation/settings_page.dart';
import 'package:mail_list/presentation/widgets/ui_kits.dart';

class MainAppPage extends HookWidget with UiKits {
  const MainAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activePage = useState(0);
    final pageViewController = usePageController();
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        onPageChanged: (value) {
          activePage.value = value;
        },
        children: [
          const HomePage(),
          const ChatPage(),
          const CalendarPage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: activePage.value,
          onTap: (value) {
            pageViewController.jumpToPage(value);
          },
          showUnselectedLabels: true,
          selectedLabelStyle: textTheme(context)
              .bodyMedium
              ?.copyWith(inherit: true, fontWeight: FontWeight.w500),
          selectedFontSize: textTheme(context).bodyMedium?.fontSize ?? 14,
          unselectedFontSize: textTheme(context).bodyMedium?.fontSize ?? 14,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colorScheme(context).secondary,
          items: <MapEntry<String, String>>[
            MapEntry(
                "Mail",
                activePage.value == 0
                    ? Assets.assetsMailActive
                    : Assets.assetsMail),
            const MapEntry("Chat", Assets.assetsChatbubbles),
            const MapEntry("Calendar", Assets.assetsCalendar),
            const MapEntry("Settings", Assets.assetsSettings),
          ]
              .map((e) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: SvgPicture.asset(
                        e.value,
                        height: 24,
                      ),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: SvgPicture.asset(
                        e.value,
                        height: 24,
                        color: colorScheme(context).secondary,
                      ),
                    ),
                    label: e.key,
                  ))
              .toList()),
    );
  }
}
