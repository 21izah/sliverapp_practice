import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/data/api_calls/jsonProvider.dart';
import 'package:sliverapp_practice/model/coinModel.dart';

import 'chart_screen.dart';

class ComplexJsonData extends StatefulWidget {
  const ComplexJsonData({super.key});

  @override
  State<ComplexJsonData> createState() => _ComplexJsonDataState();
}

class _ComplexJsonDataState extends State<ComplexJsonData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<List<CoinModel>>(
        future: ApiProvider().getCoinMarket(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final userData = data[index];
                // final name = userData.name;
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: ChartScreen(selectItem: userData),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  trailing: Container(
                    height: 20,
                    width: 60,
                    child: Sparkline(
                      data: userData.sparklineIn7D.price,
                      lineWidth: 2,
                      lineColor: userData.marketCapChangePercentage24H >= 0
                          ? Colors.red
                          : Colors.green,
                      fillMode: FillMode.below,
                      fillGradient: LinearGradient(
                        stops: [0.0, 0.7],
                        colors: userData.marketCapChangePercentage24H >= 0
                            ? [
                                Colors.red,
                                Colors.red.shade100,
                              ]
                            : [
                                Colors.green,
                                Colors.green.shade100,
                              ],
                      ),
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(userData.image),
                  ),
                  title: Text(userData.name),
                  subtitle: Text('${userData.currentPrice}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('data'));
          } else {
            return Center(
              child: Container(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange,
                  color: Colors.black,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
