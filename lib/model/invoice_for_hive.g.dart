// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_for_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceHiveModelAdapter extends TypeAdapter<InvoiceHiveModel> {
  @override
  final int typeId = 1;

  @override
  InvoiceHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceHiveModel()
      ..isInvoice = fields[0] as bool
      ..receiverName = fields[1] as String
      ..receiverAddress = fields[2] as String
      ..compnayAddress = fields[3] as String
      ..companyName = fields[4] as String
      ..note = fields[5] as String
      ..invoiceNo = fields[6] as String
      ..orderNo = fields[7] as String
      ..issueDate = fields[8] as String
      ..dueDate = fields[9] as String
      ..amount = fields[10] as double
      ..taxPercent = fields[11] as double;
  }

  @override
  void write(BinaryWriter writer, InvoiceHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.isInvoice)
      ..writeByte(1)
      ..write(obj.receiverName)
      ..writeByte(2)
      ..write(obj.receiverAddress)
      ..writeByte(3)
      ..write(obj.compnayAddress)
      ..writeByte(4)
      ..write(obj.companyName)
      ..writeByte(5)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.invoiceNo)
      ..writeByte(7)
      ..write(obj.orderNo)
      ..writeByte(8)
      ..write(obj.issueDate)
      ..writeByte(9)
      ..write(obj.dueDate)
      ..writeByte(10)
      ..write(obj.amount)
      ..writeByte(11)
      ..write(obj.taxPercent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
