import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 2)
class ExpenseData {
  @HiveField(0)
  double amount = 0;
  @HiveField(1)
  String date = '';
  @HiveField(2)
  String methodOfPayment = '';
  @HiveField(3)
  String paidTo = '';
  @HiveField(4)
  String description = '';
}
