import 'package:flutter/material.dart';
import 'providers/products.dart';
import 'providers/wallet.dart';
import './providers/transactions.dart';
import './providers/user.dart';
import './providers/order.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => User()),
    ChangeNotifierProvider(create: (_) => Products()),
    ChangeNotifierProvider(create: (_) => Wallet()),
    ChangeNotifierProvider(create: (_) => Transactions()),
    ChangeNotifierProvider(create: (_) => Order()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(builder: (context) {
        return const MyHomePage(title: 'Flutter Demo Home Page');
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (context, products, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<User>(
                builder: (context, user, child) => Text(
                  user.user.id,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var user = context.read<User>();

            // await user.loginPhone('0723010405');
            // await user.loginCode('1779');

            await user.loadUser();
            // await Provider.of<Wallet>(context, listen: false)
            //     .getBalance(user.token);
            // await Provider.of<Transactions>(context, listen: false)
            //     .getTransactions(user.token);
            // await Provider.of<Order>(context, listen: false)
            //     .getOrder(user.token, "FmzVOmby8h4z");

            // await menu.getProducts(user.token);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
