import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/models.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      required this.icons,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4.0)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user:currentUser),
              const SizedBox(width: 12.0,),
              CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: (){}),
              CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: (){}),
            ],
          ))
        ],
      ),
    );
  }
}
