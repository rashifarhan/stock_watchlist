import 'package:flutter/material.dart';

import 'package:stock_watchlist/main_page.dart';




class BottomNavigationBarWidget extends StatelessWidget {
 const BottomNavigationBarWidget({super.key});
  
   
@override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, newIndex, child) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          type: BottomNavigationBarType.fixed,
          currentIndex: newIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
         
          elevation: 5,
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
             BottomNavigationBarItem(icon: Icon(Icons.save),label: "Watchlist"),
          ],
     
         
         
         
          
        );
      },
    );
  }


}
