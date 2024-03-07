import 'package:asl_dictionary/scenes/home/asl_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:asl_dictionary/utilities/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _onSearch(String value) {
    print('Search: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ASLSearchBar(onSearch: _onSearch),
            ],
          ),
        ),
      ),
    );
  }
}