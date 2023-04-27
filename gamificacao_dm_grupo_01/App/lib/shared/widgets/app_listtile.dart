import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppListTile extends StatelessWidget {
  final bool isOdd;
  final String title;
  final String? line01Text;
  final String? line02Text;
  final String? imageURL;

  const AppListTile({
    super.key,
    this.isOdd = false,
    required this.title,
    this.line01Text,
    this.line02Text,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 3, 4, 2),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: isOdd ? Colors.yellow.shade100 : Colors.yellow.shade200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 4,
                  blurRadius: 50)
            ]),
        child: Row(
          children: [
            if (imageURL != null)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: Image.network(imageURL!).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(line01Text ?? ''),
                    Text(line02Text ?? ''),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Lottie.asset('assets/lotties/edit.json',
                          width: 30, height: 30),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
