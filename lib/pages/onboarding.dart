import 'package:flutter/material.dart';
import 'package:dispo_mobile/models/onboardingcontent.dart';
import 'package:dispo_mobile/utils/utilities.dart';
import 'package:dispo_mobile/widgets/themebutton.dart';
import 'package:dispo_mobile/utils/appcolors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<OnboardingContent> _content = Utils.getOnboarding();
  int pageIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                      child: PageView(
                        controller: _controller,
                        onPageChanged: (int page) {
                          setState(() {
                            pageIndex = page;
                          });
                        },
                        children: List.generate(
                            _content.length,
                                (index) =>
                                Container(
                                    padding: const EdgeInsets.all(40),
                                    margin: const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.MAIN_COLOR.withOpacity(0.3),
                                              blurRadius: 20,
                                              offset: Offset.zero
                                          )
                                        ]
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              const Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.account_balance_sharp, size: 22,),
                                              ),
                                              Image.asset('assets/images/${_content[index].img}.png'),
                                              const SizedBox(height: 20),
                                              Text(_content[index].message!,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: AppColors.MAIN_COLOR,
                                                      fontSize: 20
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: index == _content.length - 1,
                                          child: ThemeButton(
                                            onClick: () {
                                              // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                                            },
                                            label: 'Entrar Ahora!',
                                            color: AppColors.DARK_GREEN,
                                            highlight: AppColors.DARKER_GREEN,
                                          ),
                                        )
                                      ],
                                    )
                                )
                        ),
                      )
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          _content.length,
                              (index) =>
                              GestureDetector(
                                onTap: () {
                                  _controller!.animateTo(
                                      MediaQuery.of(context).size.width * index,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut
                                  );
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.MAIN_COLOR,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 6,
                                          color: pageIndex == index ? AppColors.LIGHTER_GREEN : Theme.of(context).canvasColor
                                      )
                                  ),
                                ),
                              )
                      )
                  ),
                  const SizedBox(height: 20),
                  ThemeButton(
                      onClick: () {
                        // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                      },
                      label: 'Saltar Onboarding'
                  )
                ],
              ),
            )
        )
    );
  }
}