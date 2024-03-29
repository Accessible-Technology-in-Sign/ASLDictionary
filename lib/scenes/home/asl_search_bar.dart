import 'package:flutter/material.dart';

class ASLSearchBar extends StatefulWidget {
  const ASLSearchBar({super.key, required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  State<ASLSearchBar> createState() => _ASLSearchBarState();
}

class _ASLSearchBarState extends State<ASLSearchBar> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: widget.onSearch,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Type your word here',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.clear),
              color: Colors.white,
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  controller.clear();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                widget.onSearch(controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}