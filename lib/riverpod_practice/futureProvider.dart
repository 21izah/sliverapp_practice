// Future<String> fetchData() async {
//   await Future.delayed(Duration(seconds: 2));
//   return 'Hello, World!';
// }


// final dataProvider = FutureProvider<String>((ref) => fetchData());

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
//               final dataAsyncValue = watch(dataProvider);
//               return dataAsyncValue.when(
//                 data: (data) => Text(data),
//                 loading: () => CircularProgressIndicator(),
//                 error: (error, stackTrace) => Text('Error: $error'),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }