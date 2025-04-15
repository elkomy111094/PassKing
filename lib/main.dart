import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/localization/app_localization.dart';
import 'package:pass_king/shared/prefs/pref_manager.dart';
import 'package:pass_king/shared/providers/language_provider.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PrefManager.init();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await FirebaseFirestore.instance.collection('notifications').add({
      'userId': FirebaseAuth.instance.currentUser?.uid ?? "",
      'title': message.notification?.title,
      'body': message.notification?.body,
      'timestamp': FieldValue.serverTimestamp(),
    });
    print(
        "📥 Notification Received in foreground: ${message.notification?.title}");
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("📲 Opened from notification: ${message.notification?.title}");
  });

/*
  //Assign publishable key to flutter_stripe
  Stripe.publishableKey =
  "pk_test_51H5E6hGtXaZtwBYvCG39zAdFDeA8qFTa9bKWxDmOzyfY5NAiwS1smV7HCcWTqz3BDDaTECbNquIWOonGMS7cWERB00o5PFocr9";
  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");*/
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.kPrimaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(new MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      builder: (_, i) => Consumer<LanguageProvider>(
        builder: (_, language, __) =>
            ResponsiveSizer(builder: (context, orientation, deviceType) {
          LanguageProvider provider = LanguageProvider();
          Locale locale = provider.appLocale;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            supportedLocales: const [Locale("en", "US")],
            locale: locale,
            onGenerateRoute: AppRoutes.appRoutes,
            initialRoute: AppRoutes.splashPage,
            navigatorKey: navigatorKey,
          );
        }),
      ),
    );
  }
}
