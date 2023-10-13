import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_bloc.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_event.dart';

class SearchFieldWidget extends StatelessWidget {
  final Size size;
  const SearchFieldWidget({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size.height*0.07,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15.0), // Adjust the value to control the roundness
       // Background color
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        
        decoration: const InputDecoration(
          hintText: 'Enter stock symbol',
          border: InputBorder.none // Remove the default border
        ),
        onChanged: (value) {
          context.read<StockListingBloc>().add(FetchStock(companyName: value.toUpperCase()));
        },
      ),
    );
  }
}