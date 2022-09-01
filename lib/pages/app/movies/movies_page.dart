import 'package:flutter/material.dart';

import 'package:up_movi_devep/ui/viewVideo.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key, this.id}) : super(key: key);
  final int? id;
// llamado al backEnd y llamamos al widget list_Videos (para que muestre los videos)
  @override
  Widget build(BuildContext context) {
    return ViewVideo(
      categories: 'Movie',
      id: 88,
    );
  }
}
