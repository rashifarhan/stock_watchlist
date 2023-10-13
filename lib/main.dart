import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stock_watchlist/di.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_model.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_bloc.dart';
import 'package:stock_watchlist/main_page.dart';

Future<void> main() async{
  
   WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    if(!Hive.isAdapterRegistered(StockModelAdapter().typeId)){
      Hive.registerAdapter(StockModelAdapter());
    }
   await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StockListingBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorSchemeSeed: Colors.teal,
          brightness: Brightness.dark,
          fontFamily: "Anton",
          useMaterial3: true
       
        ),
        home:  MainPage(),
      ),
    );
  }
}
