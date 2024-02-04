import 'package:flutter/material.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';
import 'package:vira_music_app/core/value/icons.dart';
import 'package:vira_music_app/gen/assets.gen.dart';
import 'package:vira_music_app/core/utils/extensions.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.fromLTRB(8, 6, 0, 6),
          padding: const EdgeInsets.only(left: 4),
          width: AppDimens.sizeOfDevice(context).width,
          height: 60,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: LightColors.black),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(Assets.images.pic.path),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Breathe',
                      style: LightTextStyles.normal16(
                        color: LightColors.blackText,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AppIcons.user,
                          size: AppDimens.large,
                          color: LightColors.grey,
                        ),
                        (AppDimens.small / 2).width,
                        Text(
                          'Dark Life Note',
                          style: LightTextStyles.normal14(
                              color: LightColors.greyText),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        itemCount: 15,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
    );
  }
}
