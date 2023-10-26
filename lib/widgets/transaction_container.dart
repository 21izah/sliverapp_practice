import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/transaction_details_page.dart';

class TransactionContainer extends StatelessWidget {
  final String transactionType;
  final String DateOfTransation;
  final String TimeOfTransation;
  final String TransactionAmount;
  final String youGetNairaAmount;
  const TransactionContainer({
    super.key,
    required this.transactionType,
    required this.DateOfTransation,
    required this.TransactionAmount,
    required this.TimeOfTransation,
    required this.youGetNairaAmount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: TransactionDetailsScreen(
              transactionType: transactionType,
              DateOfTransation: DateOfTransation,
              TransactionAmount: TransactionAmount,
              TimeOfTransation: TimeOfTransation,
              youGetNairaAmount: youGetNairaAmount,
            ),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        // padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 20, 10),
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionType,
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            DateOfTransation,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        TimeOfTransation,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  // child: Text('hello'),
                ),
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        '#',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        youGetNairaAmount,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        TransactionAmount,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    'Successful',
                    style: TextStyle(color: Colors.green, fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
