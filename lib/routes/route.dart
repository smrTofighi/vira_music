import 'package:get/get.dart';
import 'package:vira_music_app/modules/home/home_page.dart';
import 'package:vira_music_app/routes/name.dart';
import 'package:vira_music_app/modules/player/player_page.dart';

class AppRoutes {
  AppRoutes._();
  static List<GetPage> getPages = [
    GetPage(
      name: NamePages.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: NamePages.playerPage,
      page: () => PlayerPage(),
    ),
  ];
}
