import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/config/palette.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop  = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical:5.0,horizontal: isDesktop? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 :  0.0,
      shape: isDesktop? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),):null,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl.toString()),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
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
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding:const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 6.0,),
            Expanded(child: Text('${post.likes}',style: TextStyle(color: Colors.grey[600]),)),
            Text('${post.comments} Comments',style: TextStyle(color: Colors.grey[600]),),
            const SizedBox(width: 8.0,),
            Text('${post.shares} Shares',style: TextStyle(color: Colors.grey[600]),),
          ],
        ),
        const Divider(),
        Row(
          children: [
          _PostButton(icon:Icon(MdiIcons.thumbUpOutline,color: Colors.grey[600],size: 20.0,),label:'Like'),
          _PostButton(icon:Icon(MdiIcons.commentOutline,color: Colors.grey[600],size: 20.0,),label:'Comment'),
          _PostButton(icon:Icon(MdiIcons.shareOutline,color: Colors.grey[600],size: 25.0,),label:'Share'),
        ],)
      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  const _PostButton({Key? key, required this.icon,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(child: Container(height: 25.0,
          padding: EdgeInsets.symmetric(horizontal: 11.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            icon,
            const SizedBox(width: 4.0,),
            Text(label),
          ],),)),
      ),
    );
  }
}
