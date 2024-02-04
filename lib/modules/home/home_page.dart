import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vira_music_app/core/styles/input_decorations.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';
import 'package:vira_music_app/core/value/icons.dart';
import 'package:vira_music_app/core/utils/extensions.dart';
import 'package:vira_music_app/core/value/strings.dart';
import 'package:vira_music_app/gen/assets.gen.dart';
import 'package:vira_music_app/modules/home/views/albums_view.dart';
import 'package:vira_music_app/modules/home/views/artists_view.dart';
import 'package:vira_music_app/modules/home/views/folders_view.dart';
import 'package:vira_music_app/modules/home/views/songs_view.dart';
import 'package:vira_music_app/modules/home/widgets/tab_widget.dart';
import 'package:vira_music_app/modules/home/widgets/top_widget.dart';
import 'package:vira_music_app/modules/player_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final RxInt activeIndex = 0.obs;
  final PageController pageController = PageController();
  final PlayerController playerController = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.background,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: LightColors.background,
              title: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(AppIcons.settings),
                    ),
                    Flexible(
                      child: TextField(
                        style: LightTextStyles.normal14(),
                        decoration: AppInputDecorations.searchTextField,
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TopWidget(
                      title: EnglishStrings.favorite,
                      icon: AppIcons.heartFill,
                      colors: GradientColors.purple,
                      onTap: () {},
                    ),
                    TopWidget(
                      title: EnglishStrings.playLists,
                      icon: AppIcons.music,
                      colors: GradientColors.orange,
                      onTap: () {},
                    ),
                    TopWidget(
                      title: EnglishStrings.recent,
                      icon: AppIcons.timePast,
                      colors: GradientColors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: Column(
            children: [
              AppDimens.normal.height,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TabWidget(
                      title: EnglishStrings.songs,
                      active: activeIndex.value == 0,
                      onTap: () {
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeIn);
                        activeIndex.value = 0;
                      },
                    ),
                    TabWidget(
                      title: EnglishStrings.artists,
                      active: activeIndex.value == 1,
                      onTap: () {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeIn);
                        activeIndex.value = 1;
                      },
                    ),
                    TabWidget(
                      title: EnglishStrings.albums,
                      active: activeIndex.value == 2,
                      onTap: () {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeIn);
                        activeIndex.value = 2;
                      },
                    ),
                    TabWidget(
                      title: EnglishStrings.folders,
                      active: activeIndex.value == 3,
                      onTap: () {
                        pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeIn);
                        activeIndex.value = 3;
                      },
                    ),
                  ],
                ),
              ),
              AppDimens.small.height,
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    activeIndex.value = value;
                  },
                  children: [
                    SongsView(),
                    ArtistsView(),
                    AlbumsView(),
                    FoldersView()
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: AppDimens.sizeOfDevice(context).width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 0.5)
            ],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 65,
                child: Obx(
                  () => Row(
                    children: [
                      CircularStepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 50,
                        width: 65,
                        height: 65,
                        selectedColor: LightColors.primary,
                        selectedStepSize: 2,
                        unselectedStepSize: 2,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                          ),
                          child: Stack(
                            children: [
                              QueryArtworkWidget(
                                id: playerController.songModel.value.id,
                                type: ArtworkType.AUDIO,
                                artworkQuality: FilterQuality.high,
                                artworkWidth: double.infinity,
                                artworkHeight: double.infinity,
                                nullArtworkWidget: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: LightColors.primary,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: ImageIcon(
                                  AppIcons.playFill,
                                  color: LightColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playerController.songModel.value.title,
                              style: LightTextStyles.normal14(),
                            ),
                            Text(
                              playerController.songModel.value.duration
                                  .toString(),
                              style: LightTextStyles.normal12(
                                  color: LightColors.greyText),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ImageIcon(AppIcons.angleSmallUp)
            ],
          ),
        ),
        extendBody: true,
      ),
    );
  }
}
