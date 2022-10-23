import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'core/utils/localization.dart';
import 'core/utils/theme.dart';
import 'features/book_search/display/widgets/no_internet_widget.dart';
import 'main_bindings.dart';

class ItBookApp extends StatelessWidget {
  const ItBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'app_title'.tr,
      debugShowCheckedModeBanner: false,
      translations: Localization(),
      locale: const Locale('en'),
      theme: themes[0],
      getPages: Pages.getPages(),
      initialRoute: Routes.SEARCH_SCREEN,
      initialBinding: MainBinding(),
      builder: (context, child) => NoInternetWrapper(
        child: BotToastInit()(context, child),
      ),
    );
  }

}
