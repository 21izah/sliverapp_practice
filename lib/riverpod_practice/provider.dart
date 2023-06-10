import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';

class DataBaseProvider extends ChangeNotifier {
  /// setters
  String _btcPrice = '';
  String _ethPrice = '';

  /// getters
  String get btcPrice => _btcPrice;
  String get ethPrice => _ethPrice;

  /// functions to carry out
  void saveBitcoinPrice(String btcPrice) async {
    final _username = await Hive.box('username');
    _username.put(12, btcPrice);
  }
}
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../data/server_calls/server_data.dart';

// class ProviderExample extends ConsumerWidget {
//   final numberProvider = Provider<int>((ref) => 42);
//   ProviderExample({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef watch) {
//     return Scaffold();
//   }
// }
// final counterProvider = Provider<int>((ref) => 0);

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My App'),
//         ),
//         body: Center(
//           child: Consumer(
//             builder: (context, watch, child) {
//               final count = watch(counterProvider);
//               return Text('$count');
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             context.read(counterProvider).state++;
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
