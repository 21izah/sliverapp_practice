

// Michael Izah, [5/3/2023 2:11 AM]
// 1.
// First, you need to define a class that extends StateNotifier. Here's an example

// Michael Izah, [5/3/2023 2:11 AM]
// class CounterNotifier extends StateNotifier<int> {
//   CounterNotifier() : super(0);

//   void increment() => state++;
// }

// In the code above, we have defined a CounterNotifier class that extends StateNotifier<int> and has a single method increment() that increments the current state by 1.

// Next, you can use StateNotifierProvider from Riverpod to provide an instance of CounterNotifier to the widget tree. Here's an example:

// class CounterNotifier extends StateNotifier<int> {
//   CounterNotifier() : super(0);

//   void increment() => state++;
// }

// final counterProvider = StateNotifierProvider<CounterNotifier>((ref) => CounterNotifier());

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
//               final count = watch(counterProvider.state);
//               return Text('$count');
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             context.read(counterProvider).increment();
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }