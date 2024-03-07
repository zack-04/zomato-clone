import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zomato_clone/provider/order_provider.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final orderProvider = Provider.of<OrderProvider>(context, listen: false);
      orderProvider.fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            orderProvider.isLoading
                ? Container(
                    margin: const EdgeInsets.only(top: 200),
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : orderProvider.error.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Text(
                          orderProvider.error,
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: orderProvider.orders.length,
                        itemBuilder: (context, index) {
                          // Get the timestamp from orderProvider.orders[index]['orderDate']
                          Timestamp timestamp =
                              orderProvider.orders[index]['orderDate'];

                          // Convert the Timestamp to a DateTime object
                          DateTime dateTime = timestamp.toDate();

                          // Format the DateTime object into the desired format
                          String formattedDate =
                              DateFormat('dd MMM yyyy \'at\' hh:mm a')
                                  .format(dateTime);

                          return Container(
                            //height: 160,
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0),
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.redAccent,
                                border: Border.all(
                                    color: Color.fromARGB(255, 224, 212, 212),
                                    width: 1)),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(12),
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 242, 240, 244),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      border: Border.fromBorderSide(BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 212, 209, 209)))),
                                  child: Text(
                                    orderProvider.orders[index]['resName'],
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 12),
                                  child: ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: orderProvider
                                        .orders[index]["orderItems"].length,
                                    itemBuilder: (context, itemIndex) {
                                      return Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.eco,
                                              color: orderProvider.orders[index]
                                                          ['orderItems']
                                                      [itemIndex]["isVeg"]
                                                  ? Colors.lightGreen
                                                  : Colors.red,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                                '${orderProvider.orders[index]['orderItems'][itemIndex]["quantity"]} X ${orderProvider.orders[index]['orderItems'][itemIndex]["name"]}')
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          formattedDate,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '₹${orderProvider.orders[index]['totalAmount']}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
