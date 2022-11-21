import 'package:flutter/material.dart';

class ChipButton extends StatefulWidget {
  final String title;
  final function;
  int checked;
  var checkAble;
  ChipButton(
  {
    Key? key,
    required this.title,
    required this.function,
    required this.checked,
    required this.checkAble
  }) : super(key: key);

  @override
  State<ChipButton> createState() => _ChipButtonState(title: title, function: function, checkAble: checkAble);
}

class _ChipButtonState extends State<ChipButton> {

  final String title;
  final function;
  var checkAble;

  _ChipButtonState({required this.title, required this.function, required this.checkAble});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {

          setState(() {
            (widget.checked + 1) > 2 ? widget.checked = 0 : widget.checked++;
          });
          function();
        },
        child: Chip(
          avatar: checkAble ? (widget.checked > 0 ? (widget.checked == 1 ? CircleAvatar(backgroundColor: Colors.grey.shade800, child: Icon(Icons.arrow_downward)) : CircleAvatar(backgroundColor: Colors.grey.shade800, child: Icon(Icons.arrow_upward))) : null) : null,
          label: Text(title),
        ),
      ),
    );
  }
}