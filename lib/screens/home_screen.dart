import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutendex_app/components/genre_card.dart';
import 'package:gutendex_app/config/constants.dart';
import 'package:gutendex_app/models/genre.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of book genres
    const genres = [
      Genre(name: 'Fiction', topic: 'fiction'),
      Genre(name: 'Drama', topic: 'drama'),
      Genre(name: 'Humour', topic: 'humour'),
      Genre(name: 'Politics', topic: 'politics'),
      Genre(name: 'Philosophy', topic: 'philosophy'),
      Genre(name: 'History', topic: 'history'),
      Genre(name: 'Adventure', topic: 'adventure'),
    ];

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svgs/pattern.svg',
            height:
                MediaQuery.of(context).size.height *
                0.35, // 35% of the screen height
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(Constants.contentPadding),
              children: [
                const SizedBox(height: Constants.spacer40),
                Text(
                  'Gutenberg Project',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: Constants.spacer20),
                const Text(
                  'A social cataloging app that allows you to freely search its database of books, annotations, and reviews.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: Constants.spacer40),
                Column(
                  spacing: Constants.spacer20,
                  children: genres
                      .map((genre) => GenreCard(genre: genre))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
