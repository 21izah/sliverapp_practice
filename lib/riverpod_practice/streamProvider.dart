// 1.
// First, you need to define a stream that emits values over time. Here's an example:

// final counterStream = Stream<int>.periodic(Duration(seconds: 1), (i) => i);

// final counterProvider = StreamProvider<int>((ref) => counterStream);

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
//       ),
//     );
//   }
// }