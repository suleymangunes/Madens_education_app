import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/view/student/my-course/video/view/app.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitleLarge(text: "Video Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 200,
          width: context.width,
          child: ChewieDemo(url: url),
        ),
      ),
    );
  }
}
