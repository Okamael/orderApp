class Product {
  final String name;
  bool selected;

  Product(this.name, this.selected);

  changeSelectedState() {
    selected = !selected;
  }
}
