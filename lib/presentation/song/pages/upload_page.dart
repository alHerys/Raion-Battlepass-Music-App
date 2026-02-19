import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_field.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/utils.dart';
import '../widgets/file_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  late final TextEditingController titleController;
  late final TextEditingController artistController;
  late final PlayerController playerController;

  final formKey = GlobalKey<FormState>();
  File? selectedAudio;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    artistController = TextEditingController();
    playerController = PlayerController();
  }

  Future<void> preparePlayer() async {
    await playerController.preparePlayer(
      path: selectedAudio!.path,
      shouldExtractWaveform: true,
    );

    await playerController.seekTo(0);
  }

  void playAndPause() async {
    if (!playerController.playerState.isPlaying) {
      await playerController.startPlayer();
    } else if (!playerController.playerState.isPaused) {
      await playerController.pausePlayer();
    }
    setState(() {});
  }

  void pickImage() async {
    final pickedImage = await pickFile(fileType: .image);

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  void pickAudio() async {
    final pickedAudio = await pickFile(fileType: .audio);

    if (pickedAudio != null) {
      setState(() {
        selectedAudio = pickedAudio;
      });
      await preparePlayer();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    artistController.dispose();
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 20,
                children: [
                  Text(
                    'Upload Song',
                    style: AppText.headingSmall,
                    textAlign: .center,
                  ),

                  selectedImage == null
                      ? FilePickerWidget(
                          icon: Icons.image_outlined,
                          description: 'Select the thumbnail for your song',
                          onTap: pickImage,
                        )
                      : Column(
                          children: [
                            ClipRRect(
                              borderRadius: .circular(20),
                              child: SizedBox(
                                child: Image.file(selectedImage!, fit: .cover),
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedImage = null;
                                });
                              },
                              child: Text('Cancel Image'),
                            ),
                          ],
                        ),

                  selectedAudio == null
                      ? FilePickerWidget(
                          icon: Icons.music_note_outlined,
                          description: 'Pick a song',
                          onTap: pickAudio,
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: playAndPause,
                                  icon: Icon(
                                    playerController.playerState.isPlaying
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                  ),
                                ),
                                Flexible(
                                  child: AudioFileWaveforms(
                                    playerController: playerController,
                                    enableSeekGesture: false,
                                    size: Size(300, 50),
                                    playerWaveStyle: PlayerWaveStyle(
                                      fixedWaveColor: Colors.grey,
                                      liveWaveColor: Colors.blue,
                                      showSeekLine: true,
                                      seekLineColor: Colors.red,
                                    ),
                                    waveformType: .fitWidth,
                                  ),
                                ),
                              ],
                            ),

                            TextButton(
                              onPressed: () async {
                                await playerController.stopPlayer();
                                setState(() {
                                  selectedAudio = null;
                                });
                              },
                              child: Text('Cancel Song'),
                            ),
                          ],
                        ),

                  CustomField(
                    controller: titleController,
                    hintText: 'Song Title',
                    validator: null,
                  ),

                  CustomField(
                    controller: artistController,
                    hintText: 'Song Artist',
                    validator: null,
                  ),

                  SizedBox(height: 25),

                  ElevatedButton(onPressed: () {}, child: Text('Upload')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
