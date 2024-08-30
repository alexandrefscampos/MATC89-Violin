import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:violin/core/api.dart';
import 'package:violin/domain/search/search_repository.dart';
import 'package:violin/domain/search/search_result_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<SearchResultModel?> search(String term) async {
    try {
      final response = await dio.get(
        'search',
        queryParameters: {
          'term': term,
          'limit': 25,
          'entity': 'album',
        },
      );
      log(response.toString());
      return SearchResultModel.fromJson(jsonDecode(response.data));
    } catch (_) {
      return null;
    }
  }
}
