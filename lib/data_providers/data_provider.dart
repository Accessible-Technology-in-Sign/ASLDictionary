import 'dart:core';
import 'package:asl_dictionary/model/home/video.dart';

abstract class DataProvider {
    Future<List<Video>> getData(String searchString);
}