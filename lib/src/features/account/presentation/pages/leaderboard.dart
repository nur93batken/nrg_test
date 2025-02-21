import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class LeadersPage extends StatefulWidget {
  @override
  _LeadersPage createState() => _LeadersPage();
}

final List<Map<String, dynamic>> persons = [
  {
    'image': 'assets/images/batman.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1430 nrg',
    'medal': 'assets/images/first.png',
  },
  {
    'image': 'assets/images/captainamerica.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1320 nrg',
    'medal': 'assets/images/second.png',
  },
  {
    'image': 'assets/images/deadpool.png',
    'title': 'Nurgazy Rajapov',
    'subtitle': '1320 nrg',
    'medal': 'assets/images/third.png',
  },
  {
    'image': 'assets/images/flash.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1430 nrg',
    'medal': 'assets/images/span.png',
  },
  {
    'image': 'assets/images/hulk.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1320 nrg',
    'medal': 'assets/images/span.png',
  },
  {
    'image': 'assets/images/ironman.png',
    'title': 'Nurgazy Rajapov',
    'subtitle': '1320 nrg',
    'medal': 'assets/images/span.png',
  },
  {
    'image': 'assets/images/mario.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1430 nrg',
    'medal': 'assets/images/span.png',
  },
  {
    'image': 'assets/images/ninja.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1320 nrg',
    'medal': 'assets/images/span.png',
  },
  {
    'image': 'assets/images/pennywise.png',
    'title': 'Nurgazy Rajapov',
    'subtitle': '1320 nrg',
    'medal': 'assets/images/span.png',
  },
  {
    'image': 'assets/images/human.png',
    'title': 'Nurgazy Uson',
    'subtitle': '1430 nrg',
    'medal': 'assets/images/span.png',
  },
];

class _LeadersPage extends State<LeadersPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 40),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Лидерлер',
                        style: AppTextStyles.f24w700
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.orange1,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.blue.withOpacity(0.1),
                              width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.orange,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#6',
                                      style: AppTextStyles.f24w700
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('You are doing better than',
                                        style: AppTextStyles.f18w600
                                            .copyWith(color: AppColors.white)),
                                    Text('60% of other players!',
                                        style: AppTextStyles.f18w600.copyWith(
                                            color: AppColors.blackText)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        298, // Высота экрана
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Алдынкы 10 лидер',
                              style: AppTextStyles.f18w600
                                  .copyWith(color: AppColors.blackText),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Баары',
                                style: TextStyle(color: AppColors.blue),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: persons.length,
                            itemBuilder: (context, index) {
                              final quiz = persons[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  onTap: () {
                                    // Handle the click event here
                                  },
                                  child: LeaderCard(
                                    number: (index + 1).toString(),
                                    image: quiz['image'],
                                    title: quiz['title'],
                                    subtitle: quiz['subtitle'],
                                    medal: quiz['medal'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
