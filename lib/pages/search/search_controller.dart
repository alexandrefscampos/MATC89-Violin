import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/data/search_repository_impl.dart';
import 'package:violin/domain/search/search_result_model.dart';
import 'package:violin/domain/search/search_service.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  late final SearchService _searchService;

  @override
  FutureOr<SearchResultModel?> build() {
    _searchService = SearchService(SearchRepositoryImpl());
    return null;
  }

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final results = await _searchService.search(query);
      state = AsyncValue.data(results);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
