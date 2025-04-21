import 'package:donote/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:donote/core/constants.dart';

class NoteToolbar extends StatefulWidget {
  const NoteToolbar({super.key});

  @override
  State<NoteToolbar> createState() => _NoteToolbarState();
}

class _NoteToolbarState extends State<NoteToolbar> {
  String selectedHeader = 'Normal';
  String selectedLine = '1';
  late final QuillController quillController;

  @override
  void initState() {
    super.initState();
    quillController = QuillController.basic();
  }

  @override
  void dispose() {
    quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: primary),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: (primary), offset: Offset(4, 4))],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            QuillToolbarHistoryButton(
              isUndo: true,
              controller: quillController,
            ),
            QuillToolbarHistoryButton(
              isUndo: false,
              controller: quillController,
            ),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.bold,
            ),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.italic,
            ),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.underline,
            ),
            QuillToolbarClearFormatButton(controller: quillController),
            QuillToolbarColorButton(
              controller: quillController,
              isBackground: false,
            ),
            QuillToolbarColorButton(
              controller: quillController,
              isBackground: true,
            ),

            CustomDropdownButton(
              items: ['Normal', 'Header 1', 'Header 2', 'Header 3'],
              selectedItem: selectedHeader,
              onChanged: (value) {
                final attribute = _getHeaderAttribute(value);
                quillController.formatSelection(attribute);
                setState(() {
                  selectedHeader = value; // Update selected header
                });
              },
            ),

            CustomDropdownButton(
              items: ['1', '1.15', '1.5', '2'],
              selectedItem: 'Line Height $selectedLine',
              onChanged: (value) {
                final attribute = _getLineHeightAttribute(value);
                quillController.formatSelection(attribute);
                setState(() {
                  selectedLine = value; // Update selected header
                });
              },
            ),

            // _CustomLineHeightDropdown(controller: quillController),
            QuillToolbarToggleCheckListButton(controller: quillController),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.ol,
            ),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.ul,
            ),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.inlineCode,
            ),
            QuillToolbarToggleStyleButton(
              controller: quillController,
              attribute: Attribute.blockQuote,
            ),
            QuillToolbarIndentButton(
              controller: quillController,
              isIncrease: true,
            ),
            QuillToolbarIndentButton(
              controller: quillController,
              isIncrease: false,
            ),
            QuillToolbarLinkStyleButton(controller: quillController),
          ],
        ),
      ),
    );
  }

  Attribute _getHeaderAttribute(String value) {
    switch (value) {
      case 'Header 1':
        return Attribute.h1;
      case 'Header 2':
        return Attribute.h2;
      case 'Header 3':
        return Attribute.h3;
      default:
        return Attribute.header;
    }
  }

  Attribute _getLineHeightAttribute(String value) {
    switch (value) {
      case '1.15':
        return LineHeightAttribute.lineHeightTight;
      case '1.5':
        return LineHeightAttribute.lineHeightOneAndHalf;
      case '2':
        return LineHeightAttribute.lineHeightDouble;
      default:
        return LineHeightAttribute.lineHeightNormal;
    }
  }
}

// class _CustomLineHeightDropdown extends StatelessWidget {
//   final QuillController controller;

//   const _CustomLineHeightDropdown({required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         return IconButton(
//           icon: const Icon(Icons.format_line_spacing),
//           onPressed: () async {
//             final RenderBox button = context.findRenderObject() as RenderBox;
//             final RenderBox overlay =
//                 Overlay.of(context).context.findRenderObject() as RenderBox;
//             final Offset position = button.localToGlobal(
//               Offset.zero,
//               ancestor: overlay,
//             );

//             final lineHeights = {
//               'Unset': Attribute.clone(Attribute.lineHeight, null),
//               '1.0': Attribute.lineHeight(1.0),
//               '1.5': Attribute.lineHeight(1.5),
//               '2.0': Attribute.lineHeight(2.0),
//             };

//             final selected = await showMenu<String>(
//               context: context,
//               position: RelativeRect.fromLTRB(
//                 position.dx,
//                 position.dy,
//                 position.dx,
//                 0,
//               ),
//               items:
//                   lineHeights.entries.map((entry) {
//                     return PopupMenuItem<String>(
//                       value: entry.key,
//                       child: Text(entry.key),
//                     );
//                   }).toList(),
//             );

//             if (selected != null) {
//               controller.formatSelection(lineHeights[selected]!);
//             }
//           },
//         );
//       },
//     );
//   }
// }
