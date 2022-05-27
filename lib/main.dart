import 'package:couter_cubit/cubit/couter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CouterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Builder(
              builder: (contextData) {
                final couterStateWatch = contextData.watch<CouterCubit>().state;
                return Text(couterStateWatch.counterNumber.toString(),
                        style: Theme.of(contextData).textTheme.headline4);
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CouterCubit>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: FloatingActionButton(
              onPressed: () => context.read<CouterCubit>().decrement(),
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
