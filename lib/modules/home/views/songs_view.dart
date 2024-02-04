import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';
import 'package:vira_music_app/core/value/icons.dart';
import 'package:vira_music_app/gen/assets.gen.dart';
import 'package:vira_music_app/core/utils/extensions.dart';
import 'package:vira_music_app/modules/player_controller.dart';
import 'package:vira_music_app/routes/name.dart';

class SongsView extends StatelessWidget {
  SongsView({Key? key}) : super(key: key);
  final PlayerController playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      child: FutureBuilder(
        future: playerController.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null,
            uriType: UriType.EXTERNAL),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Songs find'),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => Obx(
                () => GestureDetector(
                  onTap: () {
                    playerController.songModel.value = snapshot.data![index];
                    playerController.isPlaying(true);
                    playerController.songIndex(index);
                    playerController.playSong(snapshot.data![index].uri);
                    Get.toNamed(NamePages.playerPage);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 6, 0, 6),
                    padding: const EdgeInsets.only(left: 4, right: 0),
                    width: AppDimens.sizeOfDevice(context).width,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: QueryArtworkWidget(
                              quality: 100,
                              artworkBorder: BorderRadius.circular(8),
                              artworkClipBehavior: Clip.antiAliasWithSaveLayer,
                              artworkFit: BoxFit.cover,
                              nullArtworkWidget: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: LightColors.primary),
                                child: ImageIcon(
                                  AppIcons.musicAlt,
                                  color: LightColors.white,
                                ),
                              ),
                              id: snapshot.data![index].id,
                              type: ArtworkType.AUDIO),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimens.sizeOfDevice(context).width *
                                    0.50,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].title,
                                      style: LightTextStyles.normal14(
                                        color:
                                            playerController.isPlaying.value &&
                                                    playerController
                                                            .songIndex.value ==
                                                        index
                                                ? LightColors.primary
                                                : LightColors.blackText,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ImageIcon(
                                          AppIcons.user,
                                          size: 14,
                                          color: LightColors.grey,
                                        ),
                                        (AppDimens.small / 2).width,
                                        Expanded(
                                          child: Text(
                                            snapshot.data![index].artist
                                                .toString(),
                                            style: LightTextStyles.normal12(
                                                color: LightColors.greyText),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              (AppDimens.large * 2).width,
                              Obx(
                                () => Visibility(
                                  visible: playerController.isPlaying.value &&
                                      playerController.songIndex.value == index,
                                  child: ImageIcon(
                                    AppIcons.playFill,
                                    color: LightColors.primary,
                                    size: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
            );
          }
        },
      ),
    );
  }
}
