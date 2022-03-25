import 'dart:io';

import 'package:first_app_dm/features/profile/presentation/widgets/photo_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

// #region _onImageButtonPressed
  Future<void> _onImageButtonPressed() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 600,
        imageQuality: 50,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }
// #endregion

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (BuildContext context, int index) {
              // Why network for web?
              // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
              return Semantics(
                label: 'image_picker_example_picked_image',
                child: kIsWeb
                    ? Image.network(_imageFileList![index].path)
                    : Image.file(File(_imageFileList![index].path)),
              );
            },
            itemCount: _imageFileList!.length,
          ),
          label: 'image_picker_example_picked_images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return _handlePreview();
    }
  }

  Widget _handlePreview() {
    return PhotoProfile(
        imageProvider: _imageProviderToShowPhoto(),
        onImageButtonPressed: _onImageButtonPressed);
    // return _previewImages();
  }

  ImageProvider _imageProviderToShowPhoto() {
    if (_imageFileList == null || _imageFileList!.isEmpty) {
      return const AssetImage(
        'assets/images/profile/no_user_profile_picture.jpg',
      );
    } else {
      return FileImage(File(_imageFileList![0].path));
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
        _imageFileList = response.files;
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: defaultTargetPlatform == TargetPlatform.android
          ? FutureBuilder<void>(
              future: retrieveLostData(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Text(
                      'You have not yet picked an image.',
                      textAlign: TextAlign.center,
                    );
                  case ConnectionState.done:
                    return _handlePreview();
                  default:
                    if (snapshot.hasError) {
                      return Text(
                        'Pick image/video error: ${snapshot.error}}',
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    }
                }
              },
            )
          : _handlePreview(),
    );

    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: Text(widget.title!),
    //   // ),
    //   body: Center(
    //     child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
    //         ? FutureBuilder<void>(
    //             future: retrieveLostData(),
    //             builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
    //               switch (snapshot.connectionState) {
    //                 case ConnectionState.none:
    //                 case ConnectionState.waiting:
    //                   return const Text(
    //                     'You have not yet picked an image.',
    //                     textAlign: TextAlign.center,
    //                   );
    //                 case ConnectionState.done:
    //                   return _handlePreview();
    //                 default:
    //                   if (snapshot.hasError) {
    //                     return Text(
    //                       'Pick image/video error: ${snapshot.error}}',
    //                       textAlign: TextAlign.center,
    //                     );
    //                   } else {
    //                     return const Text(
    //                       'You have not yet picked an image.',
    //                       textAlign: TextAlign.center,
    //                     );
    //                   }
    //               }
    //             },
    //           )
    //         : _handlePreview(),
    //   ),
    //   floatingActionButton: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: <Widget>[
    //       Semantics(
    //         label: 'image_picker_example_from_gallery',
    //         child: FloatingActionButton(
    //           onPressed: () {
    //             isVideo = false;
    //             _onImageButtonPressed(ImageSource.gallery, context: context);
    //           },
    //           heroTag: 'image0',
    //           tooltip: 'Pick Image from gallery',
    //           child: const Icon(Icons.photo),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 16.0),
    //         child: FloatingActionButton(
    //           onPressed: () {
    //             isVideo = false;
    //             _onImageButtonPressed(
    //               ImageSource.gallery,
    //               context: context,
    //               isMultiImage: true,
    //             );
    //           },
    //           heroTag: 'image1',
    //           tooltip: 'Pick Multiple Image from gallery',
    //           child: const Icon(Icons.photo_library),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 16.0),
    //         child: FloatingActionButton(
    //           onPressed: () {
    //             isVideo = false;
    //             _onImageButtonPressed(ImageSource.camera, context: context);
    //           },
    //           heroTag: 'image2',
    //           tooltip: 'Take a Photo',
    //           child: const Icon(Icons.camera_alt),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 16.0),
    //         child: FloatingActionButton(
    //           backgroundColor: Colors.red,
    //           onPressed: () {
    //             isVideo = true;
    //             _onImageButtonPressed(ImageSource.gallery);
    //           },
    //           heroTag: 'video0',
    //           tooltip: 'Pick Video from gallery',
    //           child: const Icon(Icons.video_library),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 16.0),
    //         child: FloatingActionButton(
    //           backgroundColor: Colors.red,
    //           onPressed: () {
    //             isVideo = true;
    //             _onImageButtonPressed(ImageSource.camera);
    //           },
    //           heroTag: 'video1',
    //           tooltip: 'Take a Video',
    //           child: const Icon(Icons.videocam),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}
