import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageWithPlaceholder extends StatefulWidget {
  String imageUrl;
  BoxFit boxFit;
  CachedImageWithPlaceholder(this.imageUrl,this.boxFit, {Key? key}) : super(key: key);

  @override
  State<CachedImageWithPlaceholder> createState() => _CachedImageWithPlaceholderState();
}

class _CachedImageWithPlaceholderState extends State<CachedImageWithPlaceholder> {



  Uint8List? imageBytes;
  bool isLoading = true;

  Future<void> loadImage() async {
    try {
      final dio = Dio();
      final response = await dio.get(widget.imageUrl, options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == 200) {
        if (this.mounted)
        setState(() {
          imageBytes = response.data;
        });

      } else {
        // Handle other status codes if needed
        // print('Failed to load image with status code: ${response.statusCode}');

      }
    } catch (e) {
      // Handle Dio errors
      // print('Failed to load image: $e');

    } finally {
      if (this.mounted) {
        setState(() {
        isLoading = false;
      });
      }
    }
  }




  @override
  void initState() {
    super.initState();
    // loadImage();
  }




  @override
  Widget build(BuildContext context) {
    return

        CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: widget.boxFit,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )




    ;
  }
}
