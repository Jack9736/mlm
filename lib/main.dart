import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/BreedTypeScreen/breed_type_screen.dart';
import 'package:mlm/screens/BuyerScreen/BuyChatWithSellerScreen/buy_chat_with_seller_view.dart';
import 'package:mlm/screens/BuyerScreen/BuyComplateRegScreen/buy_complete_reg_view.dart';
import 'package:mlm/screens/BuyerScreen/BuyFirstRegScreen/buy_first_reg_view.dart';
import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_screen.dart';
import 'package:mlm/screens/BuyerScreen/BuyMyProfileScreen/buy_edit_profile_view.dart';
import 'package:mlm/screens/BuyerScreen/BuyORSellScreen/buy_sell_screen.dart';
import 'package:mlm/screens/BuyerScreen/BuySecondRegistrationScreen/buy_sec_reg_view.dart';
import 'package:mlm/screens/FirstRegScreen/first_reg_screen.dart';
import 'package:mlm/screens/PetProfileScreen/pet_profile_screen.dart';
import 'package:mlm/screens/RecentlyViewScreen/recently_view_screen.dart';
import 'package:mlm/screens/SearchFilterScreen/location_filter_view.dart';
import 'package:mlm/screens/SearchFilterScreen/location_state_view.dart';
import 'package:mlm/screens/SearchFilterScreen/search_filter_view.dart';
import 'package:mlm/screens/SellerScreen/AddPetScreen/sell_add_pet_view.dart';
import 'package:mlm/screens/SellerScreen/SellFirstRegScreen/sell_first_reg_view.dart';
import 'package:mlm/screens/SellerScreen/SellHomeScreen/sell_home_screen.dart';
import 'package:mlm/screens/SellerScreen/SellSecRegScreen/sell_sec_reg_view.dart';
import 'package:mlm/screens/loginScreen/login_screen.dart';
import 'package:mlm/screens/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:mlm/screens/StartBrowsingScreen/start_browsing_view.dart';
import 'package:mlm/screens/MyMessageScreen/my_messages_screen.dart';
import 'package:mlm/screens/BuyerScreen/BuySellerProfileScreen/buy_seller_profile_view.dart';
import 'package:mlm/screens/SellerScreen/PetAddedScreen/sell_pet_added_view.dart';
import 'package:mlm/screens/BuyerScreen/BuyFavouritesScreen/buy_favourites_view.dart';
import 'package:mlm/screens/BuyerScreen/BuyMyProfileScreen/buy_myprofile_view.dart';
import 'package:mlm/screens/SellerScreen/SellMyProfileScreen/sell_myprofile_view.dart';
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
    FlutterStatusbarcolor.setStatusBarColor(AppColors.black);

    if (useWhiteForeground(AppColors.black)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(AppColors.black),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: AppConstant.ROUTE, page: () => const BuySellScreen()),
        GetPage(name: AppConstant.ROUTE_LOGIN, page: () => const LoginScreen()),
        GetPage(
            name: AppConstant.ROUTE_FORGOT_PASSWORD,
            page: () => ForgotPasswordScreen()),

        /*
        * Start Buyer Registration Screen
        * */
        GetPage(
            name: AppConstant.ROUTE_BUY_FIRST_REG,
            page: () => const BuyFirstRegView()),
        GetPage(
            name: AppConstant.ROUTE_BUY_SEC_REG,
            page: () => const BuySecRegView()),
        GetPage(
            name: AppConstant.ROUTE_BUY_COMPLETE_REG,
            page: () => const BuyCompleteRegView()),
        GetPage(
            name: AppConstant.ROUTE_START_BROWSING,
            page: () => const StartBrowsingView()),
        /*
        * End Buyer Registration Screen
        * */

        GetPage(
            name: AppConstant.ROUTE_FIRST_REG,
            page: () => const FirstRegScreen()),

        /*
        * Start Seller Registration Screen
        * */
        GetPage(
            name: AppConstant.ROUTE_SELL_FIRST_REG,
            page: () => const SellFirstRegView()),
        GetPage(
            name: AppConstant.ROUTE_SELL_SEC_REG,
            page: () => const SellSecRegView()),
        GetPage(
            name: AppConstant.ROUTE_SELL_HOME,
            page: () => const SellHomeScreen()),

        /*
        * End Seller Registration Screen
        * */

        GetPage(
            name: AppConstant.ROUTE_BUY_HOME,
            page: () => const BuyHomeScreen()),
        GetPage(
            name: AppConstant.ROUTE_RECENTLY_VIEW, page: () => RecentlyView()),
        GetPage(
            name: AppConstant.ROUTE_MY_MESSAGES,
            page: () => MyMessagesScreen()),
        GetPage(
            name: AppConstant.ROUTE_PET_PROFILE_VIEW,
            page: () => PetProfileView()),
        GetPage(
            name: AppConstant.ROUTE_BUY_SELLER_PROFILE_VIEW,
            page: () => BuySellerProfileView()),
        GetPage(
            name: AppConstant.ROUTE_PET_ADD_VIEW,
            page: () => const SellAddPetView()),
        GetPage(
            name: AppConstant.ROUTE_SELL_PET_ADDED_VIEW,
            page: () => const PetAddedView()),
        GetPage(name: AppConstant.ROUTE_FAVOURIRE, page: () => FavouriteView()),
        GetPage(
            name: AppConstant.ROUTE_BREED_TYPE_SCREEN,
            page: () => BreedTypeScreen()),
        GetPage(
            name: AppConstant.ROUTE_SEARCHFILTER_SCREEN,
            page: () => const SearchFilterView()),
        GetPage(
            name: AppConstant.ROUTE_MY_PROFILE, page: () => BuyMyProfileView()),
        GetPage(
            name: AppConstant.ROUTE_LOCATION_STATE_VIEW,
            page: () => const LocationStateView()),
        GetPage(
            name: AppConstant.ROUTE_LOCATION_FILTER_VIEW,
            page: () => const LocationFilterView()),
        GetPage(
            name: AppConstant.ROUTE_SELLER_MY_PROFILE,
            page: () => SellMyProfileView()),
        GetPage(
            name: AppConstant.ROUTE_BUY_EDIT_PROFILE,
            page: () => BuyEditProfileView()),
        GetPage(
            name: AppConstant.ROUTE_BUY_CHAT_WITH_SALLER,
            page: () => BuyChatWithSellerView()),
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
  //(20, 38, 101, 1)
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
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
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
