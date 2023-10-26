import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/model/chartModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/api_calls/jsonProvider.dart';
import 'buy_page2.dart';
import 'package:shimmer/shimmer.dart';

class ChartScreen extends StatefulWidget {
  final selectItem;

  const ChartScreen({
    super.key,
    required this.selectItem,
  });

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.network('${widget.selectItem.image}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.selectItem.id}'),
                      Text('${widget.selectItem.symbol}')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('${widget.selectItem.currentPrice}'),
                      Text(
                        '${widget.selectItem.marketCapChangePercentage24H}',
                        style: TextStyle(
                          color:
                              widget.selectItem.marketCapChangePercentage24H >=
                                      0
                                  ? Colors.red
                                  : Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Low',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                    Text('${widget.selectItem.low24H}'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'High',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                    Text('${widget.selectItem.high24H}'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Volume',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                    Text('${widget.selectItem.totalVolume}'),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: ApiProvider().getChart(widget.selectItem.id),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: screenSize.height * 0.65,
                    width: screenSize.width - 30,
                    // color: Colors.amber,
                    child: SfCartesianChart(
                      trackballBehavior: TrackballBehavior(
                        enable: true,
                        activationMode: ActivationMode.singleTap,
                      ),
                      zoomPanBehavior: ZoomPanBehavior(
                          enableDoubleTapZooming: true,
                          enablePinching: true,
                          enableSelectionZooming: true,
                          enablePanning: true,
                          zoomMode: ZoomMode.x),
                      series: <CandleSeries>[
                        CandleSeries<ChartModel, int>(
                          enableSolidCandles: true,
                          enableTooltip: true,
                          bullColor: Colors.green,
                          bearColor: Colors.red,
                          dataSource: data,
                          xValueMapper: (ChartModel sales, _) => sales.time,
                          lowValueMapper: (ChartModel sales, _) => sales.low,
                          highValueMapper: (ChartModel sales, _) => sales.high,
                          openValueMapper: (ChartModel sales, _) => sales.open,
                          closeValueMapper: (ChartModel sales, _) =>
                              sales.close,
                          animationDuration: 55,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('data'));
              } else {
                return Center(
                  child: SizedBox(
                    // height: screenSize.height * 0.65,
                    // width: screenSize.width - 30,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ttb,
                      period: Duration(milliseconds: 200),
                      baseColor: Colors.green,
                      highlightColor: Colors.red.shade100,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: screenSize.height * 0.65,
                        width: screenSize.width - 30,
                      ),
                    ),
                  ),

                  //  Container(
                  //   height: 10,
                  //   width: 10,
                  //   child: CircularProgressIndicator(
                  //     backgroundColor: Colors.deepOrange,
                  //     color: Colors.black,
                  //   ),
                  // ),
                );
              }
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    'market cap',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  Text('${widget.selectItem.marketCap}'),
                ]),
                Column(children: [
                  Text(
                    'circulating Supply ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  Text('${widget.selectItem.circulatingSupply}'),
                ]),
                Column(children: [
                  Text(
                    'total supply',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  Text('${widget.selectItem.totalSupply}'),
                ]),
                // Center(
                //     child: Text(
                //   'BUY'.tr,
                //   style: TextStyle(
                //     fontSize: screenSize.height * 0.02,
                //     color: Colors.white,
                //   ),
                // )),
              ],
            ),
            height: screenSize.height * 0.05,
            width: screenSize.height * 0.19,
            decoration: BoxDecoration(
                // color: Colors.green,
                // borderRadius: BorderRadius.circular(10),
                ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     height: screenSize.height * 0.04,
          //     // width: screenSize.height * 0.09,
          //     margin: EdgeInsets.only(left: screenSize.width * 0.42),
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: text.length,
          //       itemBuilder: (context, index) => Padding(
          //         padding: const EdgeInsets.all(5.0),
          //         child: Container(
          //             padding: EdgeInsets.only(
          //               left: 5,
          //               right: 5,
          //               top: 5,
          //               bottom: 5,
          //             ),
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                   color: Theme.of(context).colorScheme.tertiary,
          //                 ),
          //                 color: Colors.deepOrange,
          //                 borderRadius: BorderRadius.circular(
          //                   5,
          //                 )),
          //             child: Center(
          //               child: Text(
          //                 text[index],
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold, color: Colors.white),
          //               ),
          //             )),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageTransition(
                      child: BuyPage2(),
                      type: PageTransitionType.bottomToTop,
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    child: Center(
                        child: Text(
                      'BUY'.tr,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.02,
                        color: Colors.white,
                      ),
                    )),
                    height: screenSize.height * 0.05,
                    width: screenSize.height * 0.19,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageTransition(
                      child: BuyPage2(),
                      type: PageTransitionType.bottomToTop,
                    ));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'SELL'.tr,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.02,
                        color: Colors.white,
                      ),
                    )),
                    height: screenSize.height * 0.05,
                    width: screenSize.height * 0.19,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
}
