class HomeListItem {
  String id;
  String title;
  List<String> toDoItems;
  bool checked;
  int sortOrder;

  HomeListItem(this.id, this.title, this.toDoItems, this.checked, this.sortOrder);
}