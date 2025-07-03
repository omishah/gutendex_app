import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutendex_app/config/constants.dart';
import 'package:gutendex_app/models/genre.dart';
import 'package:gutendex_app/screens/genre_screen.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.radius4),
        boxShadow: Constants.commonShadow,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.radius4),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.radius4),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Constants.commonPadding,
          ),
          minTileHeight: 50,
          leading: SvgPicture.asset(
            'assets/svgs/${genre.topic}.svg',
            width: 28,
          ),
          title: Text(
            genre.name.toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          trailing: SvgPicture.asset('assets/svgs/next.svg'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => GenreScreen(genre: genre)),
            );
          },
        ),
      ),
    );
  }
}
