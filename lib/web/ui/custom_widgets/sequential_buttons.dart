import 'package:flutter/material.dart';

class SequencialButtons extends StatefulWidget {
  final List<Widget> children;
  const SequencialButtons({Key? key, required this.children}) : super(key: key);

  @override
  State<SequencialButtons> createState() => _SequencialButtonsState();
}

class _SequencialButtonsState extends State<SequencialButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.children,
    );
  }
}
