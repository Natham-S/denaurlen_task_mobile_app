import 'package:flutter/material.dart';

class PostInteractions extends StatelessWidget{
  const PostInteractions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/like.png'),
        const SizedBox(width: 16),
        Image.asset('assets/icons/comment.png'),
        const SizedBox(width: 16),
        Image.asset('assets/icons/share.png'),
      ],
    );
  }

}