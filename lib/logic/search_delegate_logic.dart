class SearchDelegateLogic {
  static List list = [];
  static List marketPlaceProducts = [];

  static void setSearchList(List entryList) {
    list.clear();
    list.addAll(entryList);
  }

  static List getSearchItemsCollection(){
    return list;
  }

  static void setMarketPlaceSearch(List products) {
    marketPlaceProducts.clear();
    marketPlaceProducts.addAll(products);
  }

  static List getMarketPlaceSearch() {
    return marketPlaceProducts;
  }
}