import 'dart:developer';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final OnAudioQuery audioQuery = OnAudioQuery();
  Rx<SongModel> songModel = SongModel({}).obs;
  final AudioPlayer audioPlayer = AudioPlayer();
  RxInt songIndex = 0.obs;
  RxBool isPlaying = false.obs;
  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  playSong(String? uri) {
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  checkPermission() async {
    var perm = await Permission.storage.status;
    if (perm.isGranted) {
    } else {
      await Permission.storage.request();
    }
  }
}
