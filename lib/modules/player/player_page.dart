import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';
import 'package:vira_music_app/core/value/icons.dart';
import 'package:vira_music_app/core/utils/extensions.dart';
import 'package:vira_music_app/modules/player_controller.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({Key? key}) : super(key: key);
  final PlayerController playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.background,
      appBar: AppBar(
        backgroundColor: LightColors.background,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AppIcons.menuDotVertical),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: ImageIcon(AppIcons.angleLeft)),
      ),
      body: SizedBox(
        width: AppDimens.sizeOfDevice(context).width,
        child: Column(
          children: [
            (AppDimens.large * 2).height,
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radius),
              ),
              child: QueryArtworkWidget(
                id: playerController.songModel.value.id,
                type: ArtworkType.AUDIO,
                artworkQuality: FilterQuality.high,
                artworkHeight: double.infinity,
                artworkWidth: double.infinity,
                nullArtworkWidget: Container(
                  padding: EdgeInsets.all(80),
                  decoration: BoxDecoration(
                    color: LightColors.primary,
                    borderRadius: BorderRadius.circular(AppDimens.radius),
                  ),
                  child: ImageIcon(
                    AppIcons.musicAlt,
                    color: LightColors.white,
                  ),
                ),
              ),
            ),
            AppDimens.large.height,
            Text(
              playerController.songModel.value.title,
              style: LightTextStyles.bold18(),
            ),
            AppDimens.small.height,
            Text(
              playerController.songModel.value.artist!,
              style: LightTextStyles.normal14(color: LightColors.greyText),
            ),
            (AppDimens.large * 2).height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:00',
                    style:
                        LightTextStyles.normal12(color: LightColors.greyText),
                  ),
                  Text(
                    '03:00',
                    style:
                        LightTextStyles.normal12(color: LightColors.greyText),
                  ),
                ],
              ),
            ),
            Slider(
              value: 0.5,
              onChanged: (value) {},
              activeColor: LightColors.primary.withOpacity(0.5),
              thumbColor: LightColors.primary,
              inactiveColor: LightColors.grey,
            ),
            (AppDimens.large * 2).height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(AppIcons.rewind),
                  color: LightColors.primary,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: LightColors.primary,
                  ),
                  child: Obx(
                    () => IconButton(
                      onPressed: () {
                        if (playerController.isPlaying.value) {
                          playerController.audioPlayer.pause();
                          playerController.isPlaying(false);
                        } else {
                          playerController.audioPlayer.play();
                          playerController.isPlaying(true);
                        }
                      },
                      icon: ImageIcon(
                        playerController.isPlaying.value
                            ? AppIcons.pauseFill
                            : AppIcons.playFill,
                        size: 32,
                      ),
                      color: LightColors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(AppIcons.forward),
                  color: LightColors.primary,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
