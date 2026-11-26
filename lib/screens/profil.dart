import 'package:flutter/material.dart';
import '../utils/colors_app.dart';
import '../utils/style.dart';
import '../utils/assets.dart'; 
import 'vivod.dart';
import 'statistika.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _topRow(),
              const SizedBox(height: 22),
              const Text('Профиль', style: AppText.screenTitle),
              const SizedBox(height: 24),
              _tabs(),
              const SizedBox(height: 24),
              if (_activeTab == 0) const CommonTabView(),
              if (_activeTab == 1) const WithdrawTabView(),
              if (_activeTab == 2) const StatsTabView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topRow() {
    return Row(
      children: [
        Container(
          width: 76,
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: const Text('+120 ₽', style: AppText.badgeSum),
        ),
        const SizedBox(width: 25),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 128,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.purple, width: 1),
              ),
              alignment: Alignment.center,
              child: const Text('Работаю', style: AppText.badgeWork),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.check, size: 14, color: Colors.white),
          ],
        ),
        const Spacer(),
        const Icon(Icons.more_horiz, color: AppColors.textGrey, size: 20),
      ],
    );
  }

  Widget _tabs() {
    const tabs = ['Общее', 'Вывод средств', 'Статистика'];
    const spacing = 44.0;
    const tabUnderlineWidth = 93.0;

    return SizedBox(
      height: 47,
      child: Stack(
        children: [
          Row(
            children: [
              for (int i = 0; i < tabs.length; i++) ...[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => _activeTab = i),
                  child: SizedBox(
                    width: tabUnderlineWidth,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tabs[i],
                        style: AppText.tabText.copyWith(
                          color: _activeTab == i
                              ? Colors.white
                              : AppColors.inactiveText,
                        ),
                      ),
                    ),
                  ),
                ),
                if (i != tabs.length - 1) const SizedBox(width: spacing),
              ],
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            left: _activeTab * (tabUnderlineWidth + spacing),
            top: 32,
            child: Container(
              width: tabUnderlineWidth,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CommonTabView extends StatelessWidget {
  const CommonTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ClipOval(
          child: Image.asset(
            AppAssets.avatar,
            width: 124,
            height: 124,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 124,
              height: 124,
              color: Colors.grey[800],
              child: const Icon(Icons.person, color: Colors.white, size: 60),
            ),
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'Никита Смирнов',
          textAlign: TextAlign.center,
          style: AppText.profileName,
        ),
        const SizedBox(height: 12),
        const Text('4,6', style: AppText.rating),
        const SizedBox(height: 4),
        const Text('рейтинг', style: AppText.caption),
        const SizedBox(height: 48),
        const Text('Район для работы', style: AppText.caption),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Домашняя зона', style: AppText.body),
            SizedBox(width: 8),
            Icon(Icons.check, size: 16, color: AppColors.purpleLight),
          ],
        ),
        const SizedBox(height: 12),
        const Text('Моя локация', style: AppText.body),
        const SizedBox(height: 40),
      ],
    );
  }
}