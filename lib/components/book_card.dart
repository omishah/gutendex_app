import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gutendex_app/config/constants.dart';
import 'package:gutendex_app/helpers/helper.dart';
import 'package:gutendex_app/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (book.readableLink != null) {
          await Helper.openLink(book.readableLink!);
        } else {
          Helper.showSnackbar(context, text: 'No viewable version available!');
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.radius8),
              boxShadow: Constants.commonShadow,
            ),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: CachedNetworkImage(
                errorWidget: (_, _, _) =>
                    const Icon(Icons.broken_image, color: Colors.grey),
                imageUrl: book.bookCoverImageUrl ?? '',
                fit: BoxFit.cover,
                width: 150,
                height: 250,
              ),
            ),
          ),
          const SizedBox(height: Constants.spacer10),
          Text(
            book.title,
            maxLines: 2,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: Constants.bookFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Constants.spacer5),
          Flexible(
            child: Text(
              book.authorName,
              maxLines: 2,
              style: const TextStyle(
                fontSize: Constants.bookFontSize,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
