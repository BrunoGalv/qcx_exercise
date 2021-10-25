import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'lang_service/app_localizations.dart';

class AppWidget extends StatefulWidget {
  bool loggedIn;

  AppWidget({Key? key, this.loggedIn = false}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) async {
    _AppWidgetState state = context.findRootAncestorStateOfType<_AppWidgetState>()!;
    state.changeLanguage(newLocale);
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  Locale? _locale;

  changeLanguage(Locale locale) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => setState(() {
      _locale = locale;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale != null ? _locale : null,
      supportedLocales: [
        Locale('pt'),
        Locale('en'),
        Locale('es'),
      ],
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (Portuguese, in this case).
        return supportedLocales.first;
      },
    ).modular();
  }
}
