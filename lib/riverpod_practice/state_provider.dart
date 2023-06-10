// final counterProvider = StateProvider((ref) => 0);
// In the code above, we have defined a counterProvider using StateProvider and passing in an initial value of 0.

// Next, you can use ProviderScope from Riverpod to provide the state of your counterProvider to the widget tree. Here's an example:

// final counterProvider = StateProvider((ref) => 0);

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
//               final count = watch(counterProvider).state;
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

// In the code above, we have defined a MyApp widget that displays the current count from the counterProvider. We use Consumer from Riverpod to listen for changes to the state of counterProvider. The Consumer widget rebuilds its child widget every time the state of counterProvider changes.

// We also use the context.read method to update the state of counterProvider when the floating action button is pressed. When the button is pressed, the state property of counterProvider is incremented by 1.

// That's it! With this setup, any widgets that depend on the state of counterProvider can listen for changes to its state and automatically update when it changes.