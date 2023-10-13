
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:stock_watchlist/features/stock_listing/data/models/stock_model.dart';

ValueNotifier<List<StockModel>> stockListNotifier=ValueNotifier([]);

Future<void> addStock(StockModel value)async{

  final stockDb=await Hive.openBox<StockModel>("my_box");
 int _id= await stockDb.add(value);
 
value.id=_id;
stockListNotifier.value.add(value);
  stockListNotifier.notifyListeners();
  
}

Future<void> getAllStock()async{
    final stockDb=await Hive.openBox<StockModel>("my_box");
  
  stockListNotifier.value.clear();
  stockListNotifier.value.addAll(stockDb.values);
  
   stockListNotifier.notifyListeners();
   


}