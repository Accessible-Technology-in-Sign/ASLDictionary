import 'package:flutter/cupertino.dart';

class ASLCupertinoSearchBar extends StatefulWidget {
  const ASLCupertinoSearchBar({super.key, required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  State<ASLCupertinoSearchBar> createState() => _ASLCupertinoSearchBarState();
}

class _ASLCupertinoSearchBarState extends State<ASLCupertinoSearchBar> {

  TextEditingController controller = TextEditingController();

  List<CupertinoButton> getSuffixChildren() {
    List<CupertinoButton> buttons = <CupertinoButton>[];

    buttons.add(
      CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(
          CupertinoIcons.search,
          color: CupertinoColors.white,
        ),
        onPressed: () {
          if (controller.text.isNotEmpty) {
            widget.onSearch(controller.text);
          }
        },
      )
    );

    if (controller.text.isNotEmpty) {
      buttons.insert(
        0, 
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.clear_circled_solid,
            color: CupertinoColors.systemGrey,
          ),
          onPressed: () {
            if (controller.text.isNotEmpty) {
              controller.clear();
              setState(() {});
            }
          },
        )
      );
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: (value) => setState(() {}),
      controller: controller,
      onSubmitted: widget.onSearch,
      style: const TextStyle(
        color: CupertinoColors.white,
      ),
      placeholder: 'Type your word here',
      placeholderStyle: const TextStyle(
        color: CupertinoColors.inactiveGray,
      ),

      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.white, width: 0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),

      suffix: Row(
        children: getSuffixChildren(),
      )
    );
  }
}