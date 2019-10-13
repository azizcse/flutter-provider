import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/user_state.dart';
class SearchText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UserState>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        state.searchText,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }

}