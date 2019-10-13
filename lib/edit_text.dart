import 'package:flutter/material.dart';
import 'package:flutter_provider/user_state.dart';
import 'package:provider/provider.dart';

class InputEditText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputEditTextState();
  }
}

class _InputEditTextState extends State<InputEditText> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UserState>(context);
    return Container(
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: "Ender text",
          border: OutlineInputBorder(),
        ),
        onChanged: (change) => state.setSearchText(change),
        onSubmitted: (submit) => state.setSearchText(submit),
      ),
    );
  }
}
