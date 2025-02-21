import 'package:flutter/material.dart';
import 'package:nrg_test/src/core/core.dart';

class LeaderCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String medal;
  final String number;

  LeaderCard(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.medal,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.blue.withOpacity(0.1),
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                        color: AppColors.blue.withOpacity(0.1), width: 2),
                  ),
                  child: Center(child: Text(number)),
                ),
                const SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  child: Image.asset(
                    image,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: AppTextStyles.f18w600
                            .copyWith(color: AppColors.blackText)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: AppTextStyles.f16w400
                            .copyWith(color: AppColors.orange)),
                  ],
                ),
              ],
            ),
            Image.asset(
              medal,
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}
