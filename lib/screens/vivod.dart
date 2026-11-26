import 'package:flutter/material.dart';
import '../utils/colors_app.dart';
import '../utils/style.dart';

class WithdrawTabView extends StatelessWidget {
  const WithdrawTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Column(
          children: [
            const Text('Доступно для снятия', style: AppText.label),
            const SizedBox(height: 12),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Inter'),
                children: const [
                  TextSpan(text: '120 870 ₽', style: AppText.bigSum),
                  TextSpan(text: ' / из 130 600 ₽', style: AppText.smallSum),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: const Text('Почему такая сумма?', style: AppText.link),
            ),
          ],
        ),
        const SizedBox(height: 56),

        Column(
          children: [
            const Text(
              'Введите сумму',
              textAlign: TextAlign.center,
              style: AppText.inputLabel,
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColors.purpleLight,
            ),
          ],
        ),

        const SizedBox(height: 40),
        const Text('Выберите карту', style: AppText.caption),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 58,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 4,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                            color: AppColors.lightGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 4,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                            color: AppColors.darkGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text('Карта ****5630', style: AppText.cardNumber),
            const SizedBox(width: 8),
            const Icon(Icons.check, size: 14, color: Colors.white),
            const Spacer(),
            const Icon(Icons.check, size: 16, color: AppColors.purpleLight),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              disabledBackgroundColor: AppColors.purple.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text('Вывести', style: AppText.button),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}