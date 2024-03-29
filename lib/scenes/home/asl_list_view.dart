import 'package:asl_dictionary/model/home/video.dart';
import 'package:asl_dictionary/scenes/home/asl_list_card.dart';
import 'package:flutter/material.dart';

class ASLListView extends StatelessWidget {
  const ASLListView({super.key, required this.items});

  final List<Video> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.all(12.0),
          child: ASLListCard(video: items[index]),
        );
      },
    );    
  }
}

