import 'package:hive_flutter/hive_flutter.dart';
import 'package:stock_watchlist/features/stock_listing/data/datasource/local/local_services.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_model.dart';

Future<void> getAllStock()async{
  final stockDb=await Hive.openBox<StockModel>("my_box");
  stockListNotifier.value.clear();
  stockListNotifier.value.addAll(stockDb.values);
   stockListNotifier.notifyListeners();


}

Future <void> deleteStock(int id)async{
   final stockDb=await Hive.openBox<StockModel>("my_box");
   await stockDb.delete(id);
   await getAllStock();

}

