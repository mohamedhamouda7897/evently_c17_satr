import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatelessWidget {
  static const String routeName = "OnboardingScreen";

  const OnboardingScreen({super.key});

  final bool isDark = false;

  // l10n , Localization
  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale == Locale("en", "US");
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/images/logo.png")),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 28,
          children: [
            Image.asset(
              "assets/images/creative.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              "onboardingTitle".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "onboardingSubTitle".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "language".tr(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.setLocale(Locale("en", "US"));
                            },
                            child: _countryWidget(isEnglish, "LR", context),
                          ),
                          SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              context.setLocale(Locale("ar", "EG"));
                            },
                            child: _countryWidget(!isEnglish, "EG", context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "theme".tr(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                      ),
                      child: Row(
                        children: [
                          _getThemeWidget(!isDark, "Sun", context),
                          SizedBox(width: 16),
                          _getThemeWidget(isDark, "Moon", context),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),

                child: Text(
                  "start".tr(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getThemeWidget(bool isDark, String iconName, BuildContext context) {
    return Container(
      decoration: isDark
          ? null
          : BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            ),
      child: ImageIcon(
        AssetImage("assets/images/$iconName.png"),
        size: 25,
        color: isDark
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
      ),
    );
  }

  Widget _countryWidget(
    bool isSelected,
    String imageName,
    BuildContext context,
  ) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            )
          : null,
      child: Image.asset(
        "assets/images/$imageName.png",
        width: 26,
        height: 24,
        fit: BoxFit.cover,
      ),
    );
  }
}
