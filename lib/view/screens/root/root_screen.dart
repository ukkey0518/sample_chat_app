import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_chat_app/view/screens/root/pages/home/home_page.dart';
import 'package:sample_chat_app/view/screens/root/pages/setting/setting_page.dart';
import 'package:sample_chat_app/view/screens/root/pages/talk/talk_page.dart';

class RootScreen extends HookWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPageType = useState(RootPageType.home);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Chat App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageType.value.index,
        onTap: (index) => currentPageType.value = RootPageType.values[index],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Talk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
      body: switch (currentPageType.value) {
        RootPageType.home => const HomePage(),
        RootPageType.talk => const TalkPage(),
        RootPageType.setting => const SettingPage(),
      },
    );
  }
}

/// An enum class that contains the types of
/// pages that can be displayed in the root screen.
enum RootPageType { home, talk, setting }
