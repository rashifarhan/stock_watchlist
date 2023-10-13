import 'package:get_it/get_it.dart';
import 'package:stock_watchlist/features/stock_listing/data/datasource/remote/stock_listing_service.dart';
import 'package:stock_watchlist/features/stock_listing/data/repository/stock_repo.dart';
import 'package:stock_watchlist/features/stock_listing/data/repository/stock_repo_implimentation.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
   getIt.registerLazySingleton<StockListingService>(() => StockListingService());

    getIt.registerLazySingleton<StockRepository>(
      () => StockRepoImplimentation(stockListingService: getIt<StockListingService>()));

  getIt.registerFactory(
      () => StockListingBloc(getIt<StockRepository>()));

}
