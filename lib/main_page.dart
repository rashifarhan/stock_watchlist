import 'package:flutter/material.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/screens/home_screens.dart';
import 'package:stock_watchlist/common/widgets/bottom_navbar.dart';
import 'package:stock_watchlist/features/stock_saving/presentation/screens/display_stock.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class MainPage extends StatelessWidget {
   MainPage({super.key});
  final pages = [
    const HomePage(),
    
    const DisplayStock()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: ValueListenableBuilder(
          
          valueListenable: indexChangeNotifier,
          builder: (context, value, child) {
            return AppBar(
              backgroundColor: Theme.of(context).primaryColorDark,
           
            title: value==0? const Text("Trade brains"):const Text("Stock Watchlist"),
            centerTitle: true,
           
          );
          },
         
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, value, child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget()
    );
  }
}
