import 'package:asl_dictionary/model/home/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:asl_dictionary/scenes/home/asl_video_screen.dart';

class ASLListCard extends StatefulWidget {
  const ASLListCard({super.key, required Video video}) : _video = video;

  final Video _video;

  @override
  State<ASLListCard> createState() => _ASLListCardState();
}

class _ASLListCardState extends State<ASLListCard> {

  void _didTap() {
    // widget.onTap(widget.index);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoScreen(video: widget._video),
        fullscreenDialog: true,
      )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _didTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
              widget._video.thumbnailUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 16), 
              child: Text(
                widget._video.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}