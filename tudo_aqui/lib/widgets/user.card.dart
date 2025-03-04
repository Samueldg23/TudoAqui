import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const UserAvatar({super.key, 
    required this.imageUrl,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: NetworkImage(imageUrl),
      child: imageUrl.isEmpty ? Icon(Icons.person, size: size) : null,
    );
  }
}

/*
ex:
UserAvatar(
  imageUrl: "url do supabase ou do spring boot",
  size: 50,
);
 */