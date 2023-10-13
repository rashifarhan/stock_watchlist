 abstract class StockListingEvent{

 }
  class FetchStock extends StockListingEvent{
    final String companyName;

  FetchStock({required this.companyName});
    
  }