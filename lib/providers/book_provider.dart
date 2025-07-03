import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gutendex_app/config/constants.dart';
import 'package:gutendex_app/config/enums.dart';
import 'package:gutendex_app/helpers/helper.dart';
import 'package:gutendex_app/models/book.dart';

class BookProvider with ChangeNotifier {
  final List<Book> _books = [];
  LoadingState _loadingState = LoadingState.done;
  FetchType _fetchType = FetchType.initial;
  int _currentPage = 1;
  String? _nextPageUrl;

  List<Book> get books => _books;
  LoadingState get loadingState => _loadingState;
  FetchType get fetchType => _fetchType;
  int get currentPage => _currentPage;
  String? get nextPageUrl => _nextPageUrl;

  Future<void> fetchBooks({
    required String topic,
    required FetchType fetchType,
    String? searchQuery,
  }) async {
    // set loading state to loading and notify listeners
    _loadingState = LoadingState.loading;
    notifyListeners();

    _fetchType = fetchType;

    // if it's initial call, reset old data like books, page number
    if (fetchType == FetchType.initial) {
      reset();
    }

    // if search query is not null and empty, append it
    final searchQueryParam =
        (searchQuery != null && searchQuery.trim().isNotEmpty)
        ? '&search=${Uri.encodeComponent(searchQuery.trim())}'
        : '';

    // determine next page to load
    int toLoadPage = fetchType == FetchType.initial ? 1 : _currentPage + 1;

    // final api url
    final apiBooksUrl =
        '${Constants.apiBaseUrl}/books/?page=$toLoadPage&mime_type=image/jpeg&topic=$topic$searchQueryParam';

    log(apiBooksUrl);

    // api response
    final apiResponse = await Helper.httpGetRequest(apiBooksUrl);

    // add all new fetched books to exisitng books list
    _books.addAll(apiResponse.results);

    // update next page url
    _nextPageUrl = apiResponse.next;

    // set current page
    _currentPage = toLoadPage;

    // set loading state to done and notify listeners
    _loadingState = LoadingState.done;
    notifyListeners();
  }

  // reset everything for fresh call
  void reset() {
    _books.clear();
    _currentPage = 1;
    _nextPageUrl = null;
    notifyListeners();
  }
}
