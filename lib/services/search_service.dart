import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/repositories/search_repository_impl.dart';

part 'search_service.g.dart';

class SearchService {
  final SearchRepositoryImpl searchRepositoryImpl;

  SearchService(this.searchRepositoryImpl);

  search(String term) {
    return searchRepositoryImpl.search(term);
  }
}

@riverpod
SearchService searchService(SearchServiceRef ref) {
  final userRepository = ref.watch(searchRepositoryProvider);
  return SearchService(userRepository);
}
