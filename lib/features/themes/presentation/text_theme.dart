import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

const CupertinoTextThemeData kCupertinoTextTheme = CupertinoTextThemeData(
  textStyle: TextStyle(fontFamily: kFontFamily, color: kTextColor, fontSize: 16),
  navTitleTextStyle: TextStyle(fontFamily: kFontFamily, color: kTextColor, fontSize: 18, fontWeight: .bold),
  navLargeTitleTextStyle: TextStyle(fontFamily: kFontFamily, color: kTextColor, fontSize: 34, fontWeight: .bold),
  actionTextStyle: TextStyle(fontFamily: kFontFamily, color: kSidebarLinkColor, fontSize: 16, fontWeight: .w500),
  actionSmallTextStyle: TextStyle(fontFamily: kFontFamily, color: kSidebarLinkColor, fontSize: 14, fontWeight: .w500),
);
