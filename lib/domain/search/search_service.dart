import 'package:violin/data/search_repository_impl.dart';

class SearchService {
  final SearchRepositoryImpl searchRepositoryImpl;

  SearchService(this.searchRepositoryImpl);

  search(String term) {
    return searchRepositoryImpl.search(term);
  }
}
