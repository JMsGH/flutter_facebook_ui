import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

import '../config/palette.dart';
import '../models/models.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms({this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: onlineUsers.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1]; // ボタン用に1足したから
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          width: 2.0,
          color: Colors.blueAccent[100],
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            'ルームを\n作成',
            style: TextStyle(
              color: Palette.facebookBlue,
            ),
          ),
        ],
      ),
    );
  }
}
