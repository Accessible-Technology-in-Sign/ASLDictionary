import 'package:asl_dictionary/model/home/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ASLListCard extends StatefulWidget {
  const ASLListCard({super.key, required Video video}) : _video = video;

  final Video _video;

  @override
  State<ASLListCard> createState() => _ASLListCardState();
}

class _ASLListCardState extends State<ASLListCard> {

  void _onTap() {
    setState(() {
      widget._video.shouldShowVideo = true;
    });

    // OverlayEntry myOverlay = OverlayEntry(
    //   builder: (context) => Positioned(
    //     top: 0,
    //     left: 0,
    //     child: Container(
    //       color: Colors.white,
    //       child: SafeArea(
    //         maintainBottomViewPadding: true,
    //         child: YoutubePlayer(
    //           controller: YoutubePlayerController(
    //             initialVideoId: widget._video.videoId,
    //             flags: const YoutubePlayerFlags(
    //               autoPlay: true,
    //               mute: false,
    //               // hideControls: true,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    // Overlay.of(context)?.insert(myOverlay);
  }

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  Widget _getWidget() {
    if (widget._video.shouldShowVideo) {
      _controller = YoutubePlayerController(
        initialVideoId: widget._video.videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          // hideControls: true,
          // loop: true          
        ),
      );
      return YoutubePlayerBuilder(
        player: YoutubePlayer(
          key: ObjectKey(_controller),
          controller: _controller,
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
      );
      // return YoutubePlayer(
      //   key: ObjectKey(_controller),
      //   controller: _controller,
      // );
    } 
    else {
      return Image.network(
        widget._video.thumbnailUrl,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget._video.shouldShowVideo) {
          _onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white,
          child: Column(
            children: [
              _getWidget(),
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
      ),   
    );
  }
}