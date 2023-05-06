import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(url),
    );
  }
}
