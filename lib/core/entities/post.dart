import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class.dart';

enum PosterType { tutor, student }

String posterTypeToName(PosterType posterType) {
  switch (posterType) {
    case PosterType.student:
      return "Student";
    case PosterType.tutor:
      return "Tutor";
    default:
      throw UnimplementedError();
  }
}

IconData posterTypeToIcon(PosterType posterType) {
  switch (posterType) {
    case PosterType.student:
      return CupertinoIcons.person_2;
    case PosterType.tutor:
      return CupertinoIcons.star;
    default:
      throw UnimplementedError();
  }
}

class Post {
  final String email;
  final String name;
  final List<Class> allClasses;
  final List<Class> intersectionClasses;
  final String desc;
  final PosterType posterType;

  const Post(
      {required this.email,
      required this.name,
      required this.posterType,
      required this.allClasses,
      required this.intersectionClasses,
      required this.desc});
}
