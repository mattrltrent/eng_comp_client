import 'package:client/widgets/touchable_opacity.dart';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/typography.dart';

class ExpandableTextfield extends StatefulWidget {
  const ExpandableTextfield({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.maxCharacters,
    this.minLines,
    this.maxLines,
    this.focusNode,
    this.padding,
    this.color,
    Key? key,
  }) : super(key: key);

  final EdgeInsets? padding;
  final TextEditingController controller;
  final Function(String) onChanged;
  final int? maxCharacters;
  final int? minLines;
  final int? maxLines;
  final String hintText;
  final FocusNode? focusNode;
  final Color? color;

  @override
  State<ExpandableTextfield> createState() => _ExpandableTextfieldState();
}

class _ExpandableTextfieldState extends State<ExpandableTextfield> {
  FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    widget.controller.clear();
    widget.controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {
          widget.focusNode != null ? widget.focusNode?.requestFocus() : focusNode.requestFocus();
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color ?? Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: CupertinoScrollbar(
                  thumbVisibility: widget.maxLines == 1 ? false : true,
                  thickness: widget.maxLines == 1 ? 0.0 : 3.0, // 3.0 is default
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(widget.maxLines == 1 ? 15 : 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(widget.maxCharacters),
                            ],
                            maxLengthEnforcement: MaxLengthEnforcement.enforced, // keep enforcement enabled
                            scrollController: scrollController,
                            // maxLength: widget.maxCharacters,
                            onChanged: (value) => widget.onChanged(value),
                            maxLines: widget.maxLines,
                            minLines: widget.minLines,
                            keyboardType: TextInputType.multiline,
                            focusNode: widget.focusNode ?? focusNode,
                            controller: widget.controller,
                            style: kBody.copyWith(color: Theme.of(context).colorScheme.primary),
                            decoration: InputDecoration.collapsed(
                              hintText: widget.hintText,
                              hintStyle: kBody.copyWith(color: Theme.of(context).colorScheme.onSurface),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            widget.maxLines == 1
                ? AnimatedSize(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 250),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: widget.controller.text.isNotEmpty
                        ? TouchableOpacity(
                            onTap: () => widget.controller.clear(),
                            child: Container(
                              // Transparent hitbox trick.
                              color: Colors.transparent,
                              height: kBody.fontSize! + 22,
                              padding: EdgeInsets.only(left: widget.controller.text.isNotEmpty ? 10 : 0),
                              child: Icon(
                                CupertinoIcons.trash,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          )
                        : Container(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
