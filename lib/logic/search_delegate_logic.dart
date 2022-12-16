class SearchDelegateLogic {
  static List list = [];

  static void setSearchList(List entryList) {
    list.clear();
    list.addAll(entryList);
  }

  static List getSearchItemsCollection(){
    return list;
  }
}