import 'package:asl_dictionary/data_providers/data_provider.dart';
import 'package:asl_dictionary/network/network_handler.dart';
import 'package:logger/web.dart';
import 'package:asl_dictionary/model/home/video.dart';

class YouTubeDataProvider extends DataProvider {

  final NetworkHandler _networkHandler;
  final String _apiKey = "AIzaSyA8LXtz0zgcYWJSJJY_iJMXmaCUpRlnyi4";
  final String _baseUrl = "https://www.googleapis.com/youtube/v3/search";
  final String _channelId = "UCACxqsL_FA-gMD2fwil7ZXA";
  
  YouTubeDataProvider(NetworkHandler networkHandler) : _networkHandler = networkHandler;
  YouTubeDataProvider.namedConstructor() : _networkHandler = DioNetworkHandler();

  Logger logger = Logger();
  

  @override
  Future<List<Video>> getData(String searchString) {

    return _networkHandler.get(_baseUrl, queryParameters: {
      "part": "snippet",
      "q": searchString,
      "channelId": _channelId,
      "key": _apiKey,
    }).then((response) {
      logger.d(response.data['items']);
      List<Video> videos = [];
      for (var video in response.data['items']) {
        Map<String, dynamic> snippet = video['snippet'];
        videos.add(
          Video(
            thumbnailUrl: snippet['thumbnails']['medium']['url'],
            title: snippet['title'],
            videoId: video['id']['videoId']
          )
        );
      }
      return videos;
    });
  }
}
