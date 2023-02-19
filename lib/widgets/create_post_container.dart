import 'package:assignment_course/manager/color_manager.dart';
import 'package:assignment_course/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../model/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        )
                ]),
          ),
          // post.imageUrl != null
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 8.0),
          //         child: CachedNetworkImage(imageUrl: post.imageUrl),
          //       )
          //     : const SizedBox.shrink()
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStatus(post: post),
          )
        ],
      ),
    );
  }
}

class _PostStatus extends StatelessWidget {
  final Post post;
  const _PostStatus({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              decoration: const BoxDecoration(
                  color: ColorManager.lightBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: ColorManager.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon:
                  Icon(Icons.star_border, color: Colors.grey[600], size: 20.0),
              onTap: () {},
              label: 'Like',
            ),
            _PostButton(
              icon: Icon(Icons.comment, color: Colors.grey[600], size: 20.0),
              onTap: () {},
              label: 'Comment',
            ),
            _PostButton(
              icon: Icon(Icons.share, color: Colors.grey[600], size: 25.0),
              onTap: () {},
              label: 'Share',
            ),
          ],
        ),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvater(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}  ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;

  const _PostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              icon,
              const SizedBox(
                width: 6.0,
              ),
              Text(label),
            ]),
          ),
        ),
      ),
    );
  }
}
