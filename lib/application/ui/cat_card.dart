import 'package:flutter/material.dart';
import 'package:flutter_cat_api/application/util/util.dart';
import 'package:shimmer/shimmer.dart';

class CatCard extends StatelessWidget {
  final String id;
  final double width;
  final double height;
  final String url;

  const CatCard({
    Key? key,
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width * .9 / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            url,
            width: _width,
            height: Util.getHeight(
                width: width, height: height, targetWidth: _width),
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Container(
                width: _width,
                height: Util.getHeight(
                    width: width, height: height, targetWidth: _width),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Text(loadingProgress.expectedTotalBytes != null
                          ? (loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes! *
                                      100)
                                  .toStringAsFixed(2) +
                              '%'
                          : '100%'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'ID: ',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: id,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

/*
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return SizedBox(
                width: _width,
                height: Util.getHeight(
                    width: width, height: height, targetWidth: _width),
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
 */

/*
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: const Color(0x55FFFFFF),
                child: Container(
                  width: _width,
                  height: Util.getHeight(
                      width: width, height: height, targetWidth: _width),
                  color: Colors.black,
                ),
              );
            },
 */
