import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutendex_app/components/book_card.dart';
import 'package:gutendex_app/components/search_box.dart';
import 'package:gutendex_app/config/constants.dart';
import 'package:gutendex_app/config/enums.dart';
import 'package:gutendex_app/models/genre.dart';
import 'package:gutendex_app/providers/book_provider.dart';
import 'package:provider/provider.dart';

class GenreScreen extends StatefulWidget {
  final Genre genre;
  const GenreScreen({super.key, required this.genre});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final _scrollController = ScrollController();
  late BookProvider _provider;
  String? _searchQuery;

  _scrollListener() {
    // determine the remaining pixel
    final remaining =
        _scrollController.position.maxScrollExtent -
        _scrollController.position.pixels;

    // load more data only:
    // if user has reached end of the (list height - 120)
    // not loading currently and next page url is not null
    if (remaining <= 120 &&
        _provider.loadingState == LoadingState.done &&
        _provider.nextPageUrl != null) {
      _provider.fetchBooks(
        topic: widget.genre.topic,
        searchQuery: _searchQuery,
        fetchType: FetchType.loadMore,
      );
    }
  }

  @override
  void initState() {
    // load initial data by selected genre/topic
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider = Provider.of<BookProvider>(context, listen: false);
      _provider.fetchBooks(
        topic: widget.genre.topic,
        fetchType: FetchType.initial,
      );
    });

    // attach scroll listner function to scroll controller
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    // dispose the scroll controller
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svgs/back.svg', width: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.genre.name),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Constants.commonPaddingLarge,
              right: Constants.commonPaddingLarge,
              bottom: Constants.commonPaddingLarge,
            ),
            child: SearchBox(
              onSubmit: (value) {
                _searchQuery = value.trim().isNotEmpty ? value.trim() : null;

                // on user input submit, fetch books matching search query
                _provider.fetchBooks(
                  topic: widget.genre.topic,
                  fetchType: FetchType.initial,
                  searchQuery: _searchQuery,
                );
              },
            ),
          ),
        ),
      ),
      body: Consumer<BookProvider>(
        builder: (_, provider, _) {
          if (provider.loadingState == LoadingState.loading &&
              provider.fetchType == FetchType.initial) {
            return const Center(
              child: CircularProgressIndicator(color: Constants.primaryColor),
            );
          } else if (provider.books.isEmpty) {
            return const Center(child: Text('Oops, no search match found!'));
          }
          return GridView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: Constants.spacer20,
              crossAxisSpacing: Constants.spacer20,
              childAspectRatio: 1 / 2.3,
            ),
            padding: const EdgeInsets.all(Constants.contentPadding),
            itemCount: provider.books.length,
            itemBuilder: (context, index) {
              return BookCard(book: provider.books[index]);
            },
          );
        },
      ),
    );
  }
}
