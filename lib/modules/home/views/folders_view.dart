import 'package:flutter/cupertino.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';
import 'package:vira_music_app/core/value/icons.dart';


class FoldersView extends StatelessWidget {
  const FoldersView({Key? key}) : super(key: key);

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
              Container(
                padding: const EdgeInsets.all(6),
                width: 50,
                height: 50,
                child: ImageIcon(
                  AppIcons.folder,
                  color: LightColors.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Downloads',
                      style: LightTextStyles.normal16(
                        color: LightColors.blackText,
                      ),
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
        itemCount: 25,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
    );
  }
}
