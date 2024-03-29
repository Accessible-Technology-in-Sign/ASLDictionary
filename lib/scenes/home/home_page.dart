import 'package:asl_dictionary/scenes/home/asl_cupertino_search_bar.dart';
import 'package:asl_dictionary/scenes/home/asl_list_view.dart';
import 'package:asl_dictionary/data_providers/data_provider.dart';
import 'package:asl_dictionary/data_providers/youtube_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:asl_dictionary/utilities/app_colors.dart';
import 'package:asl_dictionary/model/home/video.dart';

class HomePage extends StatefulWidget {

  final DataProvider _dataProvider;

  const HomePage({super.key, required DataProvider dataProvider}) : _dataProvider = dataProvider;
  HomePage.namedConstructor({super.key}) : _dataProvider = YouTubeDataProvider.namedConstructor();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Video> _items = [];

  void _onSearch(String value) {
    _getData(value);
  }

  void _getData(String queryString) async {
    List<Video> items = await widget._dataProvider.getData(queryString);
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(12.0),
              child: ASLCupertinoSearchBar(onSearch: _onSearch),
            ),
            Expanded(
              child: ASLListView(items: _items),
            )
          ],
        ),
      ),
    );
  }
}