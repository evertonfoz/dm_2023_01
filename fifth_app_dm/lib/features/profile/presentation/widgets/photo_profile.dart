import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget {
  final Function onImageButtonPressed;
  final ImageProvider imageProvider;

  const PhotoProfile({
    Key? key,
    required this.onImageButtonPressed,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Stack(
        children: [
          CircleAvatar(
              maxRadius: MediaQuery.of(context).size.width * 0.4,
              foregroundImage: imageProvider),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () async => await onImageButtonPressed(),
              child: const Icon(
                Icons.photo_outlined,
                size: 60,
                color: Colors.indigo,
              ),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.indigo,
            //     // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            //     // textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //   ),
            //   onPressed: () async => await onImageButtonPressed(),
            //   child: const Icon(
            //     Icons.photo_outlined,
            //     size: 40,
            //     color: Colors.yellow,
            //   ),
            //   // label: const Text('Selecionar foto'),
            // ),
          )
        ],
      ),
    );
  }
}
