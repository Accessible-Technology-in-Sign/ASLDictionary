import 'package:flutter/material.dart';
import 'package:asl_dictionary/model/home/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key, required this.video});

  final Video video;
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: video.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      // hideControls: true,
      loop: true          
    ),
  ); 

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  @override
  Widget build(BuildContext context) {
    
    EdgeInsets padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height - padding.top - padding.bottom - kToolbarHeight - 60;
    double width = MediaQuery.of(context).size.width - padding.left - padding.right - 20; 

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              key: ObjectKey(widget._controller),
              controller: widget._controller,
              // aspectRatio: height / width,
              aspectRatio: 16 / 9,
            ),
            builder: (_, player) {
              return Column(
                children: [
                    // some widgets
                    player,
                    //some other widgets
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
