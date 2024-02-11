import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.bagShopping,
          ),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.shoePrints,
          ),
          label: 'Go Out',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.crown,
          ),
          label: 'Pro',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.shop,
          ),
          label: 'Grocery',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.heartCircleBolt,
          ),
          label: 'Nutrition',
        ),
      ],
    );
  }
}
