import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "OnboardingScreen";

  const OnboardingScreen({super.key});

  final bool isDark = false;

  // l10n , Localization
  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale == Locale("en", "US");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
      ),

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
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5669FF),
              ),
            ),
            Text(
              "onboardingSubTitle".tr(),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1C1C1C),
              ),
            ),
            Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "language".tr(),
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5669FF),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xFF5669FF), width: 3),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.setLocale(Locale("en", "US"));
                            },
                            child: _countryWidget(isEnglish, "LR"),
                          ),
                          SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              context.setLocale(Locale("ar", "EG"));
                            },
                            child: _countryWidget(!isEnglish, "EG"),
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
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5669FF),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xFF5669FF), width: 3),
                      ),
                      child: Row(
                        children: [
                          _getThemeWidget(!isDark, "Sun"),
                          SizedBox(width: 16),
                          _getThemeWidget(isDark, "Moon"),
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
                  backgroundColor: Color(0xFF5669FF),
                ),

                child: Text(
                  "start".tr(),
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getThemeWidget(bool isDark, String iconName) {
    return Container(
      decoration: isDark
          ? null
          : BoxDecoration(
              color: Color(0xFF5669FF),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xFF5669FF), width: 3),
            ),
      child: ImageIcon(
        AssetImage("assets/images/$iconName.png"),
        size: 25,
        color: isDark ? Color(0xFF5669FF) : Color(0xFFF2FEFF),
        // color: Color(0xFFF2FEFF),
      ),
    );
  }

  Widget _countryWidget(bool isSelected, String imageName) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xFF5669FF), width: 3),
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
