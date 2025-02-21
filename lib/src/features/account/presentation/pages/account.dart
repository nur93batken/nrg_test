import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/core.dart';
import '../widgets/dropdown.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Колдонуучунун сүрөтү жана аты-жөнү
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.orange1.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: AppColors.blue.withOpacity(0.1),
                                  width: 2)),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/ironman.png',
                                width: 50,
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nurgazy Uson',
                            style: AppTextStyles.f24w700
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Статистика болүмү
                  Container(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Статистика',
                              style: AppTextStyles.f20w700
                                  .copyWith(color: AppColors.blackText),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Колдонуучунун упайлары
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.orange1.withOpacity(0.2),
                                  width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/star.png',
                                      width: 24,
                                    ),
                                    Text('NRG',
                                        style: AppTextStyles.f16w400.copyWith(
                                            color: AppColors.blackText
                                                .withOpacity(0.7))),
                                    Text('16012',
                                        style: AppTextStyles.f20w700.copyWith(
                                            color: AppColors.blackText)),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/divider.png',
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/geography.png',
                                      width: 24,
                                    ),
                                    Text('ОРУН',
                                        style: AppTextStyles.f16w400.copyWith(
                                            color: AppColors.blackText
                                                .withOpacity(0.7))),
                                    Text('60',
                                        style: AppTextStyles.f20w700.copyWith(
                                            color: AppColors.blackText)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        // Ай, Жума жана күн боюнча статистика
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/group.png'), // Укажите путь к вашему изображению
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomDropdown(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'You have played a total 24 quizzes this month!',
                                      style: AppTextStyles.f18w600.copyWith(
                                        color: AppColors.blackText,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                        radius: 80.0,
                                        lineWidth: 15.0,
                                        animation: true,
                                        percent: 24 / 50, // Ваш прогресс
                                        center: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '24',
                                              style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w900,
                                                  color: AppColors.blackText),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "/50",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColors.greyText,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "quiz played",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.greyText,
                                              ),
                                            ),
                                          ],
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor:
                                            AppColors.blue, // Цвет прогресса
                                        backgroundColor:
                                            AppColors.white, // Цвет фона
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: AppColors.grey
                                                      .withOpacity(0.2),
                                                  width: 2)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('5',
                                                        style: TextStyle(
                                                            fontSize: 32,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: AppColors
                                                                .blackText)),
                                                    Image.asset(
                                                      'assets/images/folder.png',
                                                      width: 24,
                                                    ),
                                                  ],
                                                ),
                                                Text('Quiz Created',
                                                    style: AppTextStyles.f16w400
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackText)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: AppColors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: AppColors.orange1
                                                      .withOpacity(0.2),
                                                  width: 2)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text('124',
                                                        style: TextStyle(
                                                            fontSize: 32,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: AppColors
                                                                .blackText)),
                                                    Image.asset(
                                                      'assets/images/first.png',
                                                      width: 24,
                                                    ),
                                                  ],
                                                ),
                                                Text('Quiz Won',
                                                    style: AppTextStyles.f16w400
                                                        .copyWith(
                                                            color: AppColors
                                                                .white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
