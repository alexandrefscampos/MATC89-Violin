import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/core/api.dart';
import 'package:violin/models/search_result_model.dart';

part 'search_repository_impl.g.dart';

class SearchRepositoryImpl {
  final Dio dio;
  const SearchRepositoryImpl(this.dio);

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

@riverpod
SearchRepositoryImpl searchRepository(SearchRepositoryRef ref) {
  final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  return SearchRepositoryImpl(dio);
}
