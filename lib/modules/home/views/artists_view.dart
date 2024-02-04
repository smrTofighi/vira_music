import 'package:flutter/material.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';
import 'package:vira_music_app/core/value/icons.dart';
import 'package:vira_music_app/core/utils/extensions.dart';

class ArtistsView extends StatelessWidget {
  const ArtistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.sizeOfDevice(context).width,
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.fromLTRB(8, 6, 0, 6),
          padding: const EdgeInsets.only(left: 4),
          width: AppDimens.sizeOfDevice(context).width,
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AppIcons.user,
                          size: AppDimens.large,
                          color: LightColors.black,
                        ),
                        (AppDimens.small / 2).width,
                        Text(
                          'Dark Lift Note',
                          style: LightTextStyles.normal16(
                            color: LightColors.blackText,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '12 songs',
                      style:
                          LightTextStyles.normal14(color: LightColors.greyText),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
    );
  }
}
