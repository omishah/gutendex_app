import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutendex_app/config/constants.dart';

class SearchBox extends StatefulWidget {
  final ValueChanged<String>? onSubmit;

  const SearchBox({super.key, this.onSubmit});

  @override
  State<SearchBox> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBox> {
  final _controller = TextEditingController();

  // clear inputs
  void _clearInput() {
    _controller.clear();
    widget.onSubmit?.call('');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // listener for any input change
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // dispose controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      controller: _controller,
      onSubmitted: widget.onSubmit,
      cursorColor: Constants.primaryColor,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Constants.secondaryTextColor,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: IconButton(
          icon: SvgPicture.asset('assets/svgs/search.svg'),
          onPressed: null,
        ),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: SvgPicture.asset('assets/svgs/cancel.svg'),
                onPressed: _clearInput,
              )
            : null,
        filled: true,
        fillColor: Constants.inputBgColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Constants.commonPadding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.radius4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Constants.primaryColor, width: 2),
        ),
      ),
      style: const TextStyle(fontWeight: FontWeight.w600),
    );
  }
}
