import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/services/search_service.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  late final SearchService _searchService;

  @override
  FutureOr<SearchResultModel?> build() {
    _searchService = ref.watch(searchServiceProvider);
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
