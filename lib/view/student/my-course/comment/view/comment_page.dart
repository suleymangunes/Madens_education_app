import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("$id"));
  }
}
