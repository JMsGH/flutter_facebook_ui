import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  CreatePostContainer({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 6.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: '何を考えている？'),
                ),
              )
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  onPressed: () => print('Live'),
                  label: Text('Live'),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  onPressed: () => print('写真'),
                  label: Text('写真'),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  onPressed: () => print('ルーム'),
                  label: Text('ルーム'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
