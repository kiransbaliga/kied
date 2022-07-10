class OrderItem {
  String name = '';

  ///Price will be calculated by multiplying rate and quantity.
  double quantity = 0, rate = 0, price = 0;
  // The metric of the item. Can be Nos/Kg/L/tonnes/..
  String metric = 'Nos';
}
