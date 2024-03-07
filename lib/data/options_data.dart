import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/model/options.dart';

List<Options> profileOptions = [
  Options(
    title: 'Your orders',
    icon: const FaIcon(FontAwesomeIcons.bagShopping),
  ),
  Options(
    title: 'Favorite orders',
    icon: const FaIcon(FontAwesomeIcons.heart),
  )
];

List<Options> accountOptions = [
  Options(
    title: 'Settings',
    icon: const FaIcon(FontAwesomeIcons.gear),
  ),
  Options(
    title: 'Log out',
    icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
  )
];

List<String> label = [
  'Name',
  'Mobile',
  'Email',
  'Date of birth',
  'Anniversary',
  'Gender',
];
