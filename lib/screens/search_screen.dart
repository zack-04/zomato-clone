import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    double resHeadFontSize = screenWidth < 400 ? 20 : 22;
    return Scaffold(
      body: Column(
        children: [
          //top row
          Container(
            margin:  EdgeInsets.only(top: screenWidth*0.15, bottom: screenWidth*0.02),
            padding:  EdgeInsets.only(left: screenWidth*0.04,right: screenWidth*0.03,),
            child: Row(
              children: [
                const FaIcon(FontAwesomeIcons.locationDot),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  width: _mediaQuery.size.width * 0.7,
                  child: Text(
                    'home - Karol Bagh, New Delhi',
                    style: TextStyle(
                      fontSize: resHeadFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: _mediaQuery.size.width*0.04,),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(FontAwesomeIcons.xmark),
                ),
              ],
            ),
          ),
          //dash line
          Container(
            width: 400,
            margin: const EdgeInsets.only(
              left: 38,
              right: 80,
            ),
            child: Row(
              children: List.generate(
                1000 ~/ 10,
                (index) => Expanded(
                  child: Container(
                    color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                    height: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          //search bar
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Start typing...',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.pink,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //recently searched and clear button
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recently searched',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Clear',
                    style: TextStyle(color: Colors.pink, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          //recently searched names
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                //1st container
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.clock),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Burger King')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                //2nd container
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.clock),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Dominos')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                //3rd container
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.clock),
                      SizedBox(
                        width: 4,
                      ),
                      Text('KFC')
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
