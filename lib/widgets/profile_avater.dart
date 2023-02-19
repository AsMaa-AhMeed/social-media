import 'package:assignment_course/manager/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvater extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool? hasBorder;

  const ProfileAvater(
      {super.key,
      required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: ColorManager.lightBlue,
          child: CircleAvatar(
              radius: hasBorder! ? 17.0 : 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(imageUrl)),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.online,
                    border: Border.all(width: 2.0, color: Colors.white),
                  ),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
