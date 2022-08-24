import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';
import 'package:mlm/screens/loginScreen/login_screen.dart';
import 'package:mlm/screens/BuyORSellScreen/buy_sell_screen.dart';
import 'package:mlm/screens/FirstRegistrationScreen/first_registration_screen.dart';
import 'package:mlm/screens/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:mlm/screens/SignUpStepOne/signUp_step_one_screen.dart';
import 'package:mlm/screens/BuySecondRegistrationScreen/buy_sec_reg_screen.dart';
import 'Binding/app_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(AppConstant.STORAGE_NAME);
  AppBinding().dependencies();
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.black),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: AppConstant.ROUTE, page: () => BuySellScreen()),
        GetPage(name: AppConstant.ROUTE_LOGIN, page: () => LoginScreen()),
        GetPage(name: AppConstant.ROUTE_FORGOT_PASSWORD, page: () => ForgotPasswordScreen()),
        GetPage(name: AppConstant.ROUTE_BUY_SELL, page: () => BuySellScreen()),
        GetPage(name: AppConstant.ROUTE_FIRST_REGISTRATION, page: () => FirstRegistrationScreen()),
        GetPage(name: AppConstant.ROUTE_SIGNUP_STEP_ONE, page: () => SignUpStepOneScreen()),
        GetPage(name: AppConstant.ROUTE_BUY_SEC_REG, page: () => BuySecRegScreen()),

        // GetPage(
        //     name: AppConstant.ROUTE_UPDATE_CONTACTDETAILS,
        //     page: () => const UpdateContactDetailsScreen()),
        // GetPage(
        //     name: AppConstant.ROUTE_ACCOUNT_DETAILS,
        //     page: () => const AccountDetailsPage()),
        // GetPage(
        //     name: AppConstant.ROUTE_CONTACT_DETAILS,
        //     page: () => const ContactDetailsPage()),
        // GetPage(
        //     name: AppConstant.ROUTE_CONTACT_LIST,
        //     page: () => ContactListPage()),
      ],
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(),
      ),
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
