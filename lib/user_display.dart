import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/user_state.dart';

class UserDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UserState>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: state.isFetching
          ? CircularProgressIndicator()
          : state.getResponseJson() != null
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.getResponseJson().length,
                  itemBuilder: (context, index) {
                    return ListTile(leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          state.getResponseJson()[index]['avatar']),
                    ),
                      title: Text(
                        state.getResponseJson()[index]["first_name"],
                      ),
                    );
                  })
              : Text("Press Button above to fetch data"),
    );
  }
}
