import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomSelectionArea extends StatelessWidget {
  final Widget child;
  final Function(SelectedContent?)? onSelectionChanged;
  final Widget Function(BuildContext, SelectableRegionState)?
      contextMenuBuilder;
  final List<ContextMenuButtonItem> menuButtonItems;

  const CustomSelectionArea(
      {super.key,
      required this.child,
      this.onSelectionChanged,
      this.contextMenuBuilder,
      required this.menuButtonItems});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
        onSelectionChanged: onSelectionChanged,
        contextMenuBuilder: contextMenuBuilder ??
            (context, editableTextState) {
              final List<ContextMenuButtonItem> buttonItems =
                  editableTextState.contextMenuButtonItems;

              buttonItems.addAll(menuButtonItems);

              return AdaptiveTextSelectionToolbar.buttonItems(
                anchors:
                    TextSelectionToolbarAnchors(primaryAnchor: Offset(30, 100)),
                buttonItems: buttonItems,
              );
            },
        child: child);
  }
}
