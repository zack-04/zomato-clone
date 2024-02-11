import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/data/options_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  height: 210,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/profile_card.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img1.jpeg',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          //column
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Krishna',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'bhatiakrishna529@gmail.com',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'View activity',
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.arrow_right_sharp,
                                          color: Colors.white, size: 20.0),
                                    ),
                                  ],
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    //2nd container
                    Container(
                      margin:
                          const EdgeInsets.only(left: 40, right: 15, top: 20),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown[600],
                            ),
                            padding: const EdgeInsets.all(6),
                            height: 40,
                            width: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow[800],
                              ),
                              height: 30,
                              width: 30,
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.crown,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Gold member',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.yellow[700],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.yellow),
                              color: Colors.brown[500],
                            ),
                            child: const Text(
                              'saved ₹${2449}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.yellow[700],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //2nd column
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Row(
                            children: [
                              //favourites
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 120,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                        ),
                                        height: 30,
                                        width: 30,
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.heart,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Favourites',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              //money container
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 120,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                        ),
                                        height: 30,
                                        width: 30,
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.indianRupeeSign,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Money',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(left: 20, right: 15),
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.red,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Food Orders',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              //list view
                              Container(
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: profileOptions.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      margin: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[200],
                                            ),
                                            height: 40,
                                            width: 40,
                                            child: Center(
                                              child: profileOptions[index].icon,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              profileOptions[index].title,
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const FaIcon(
                                              FontAwesomeIcons.angleRight),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 60),
                                      child: Divider(
                                        color: Colors.grey[200],
                                        height: 1,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(
                              left: 20, right: 15, bottom: 40),
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.red,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'More',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              //list view
                              Container(
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: profileOptions.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      margin: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[200],
                                            ),
                                            height: 40,
                                            width: 40,
                                            child: Center(
                                              child: accountOptions[index].icon,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              accountOptions[index].title,
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const FaIcon(
                                              FontAwesomeIcons.angleRight),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 60),
                                      child: Divider(
                                        color: Colors.grey[200],
                                        height: 1,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
