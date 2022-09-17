// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);
//https://app.quicktype.io/
import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
  Product({
    required this.producTId,
    required this.producTName,
    required this.producTCode,
    required this.producTNotes,
    required this.nOOfQuantity,
    required this.producTCost,
    required this.sellinGCost,
    required this.purchasEDate,
    required this.purchaseorderkey,
    required this.productSTypeId,
    required this.producTType,
    required this.quantitYTypeId,
    required this.quantitYTypeName,
    required this.supplieRId,
    required this.supplieRName,
    required this.supplieRContact,
  });

  int producTId;
  String producTName;
  dynamic producTCode;
  String producTNotes;
  int nOOfQuantity;
  int producTCost;
  int sellinGCost;
  DateTime purchasEDate;
  dynamic purchaseorderkey;
  int productSTypeId;
  String producTType;
  int quantitYTypeId;
  String quantitYTypeName;
  int supplieRId;
  String supplieRName;
  String supplieRContact;

  Product copyWith({
    required int producTId,
    required String producTName,
    required dynamic producTCode,
    required String producTNotes,
    required int nOOfQuantity,
    required int producTCost,
    required int sellinGCost,
    required DateTime purchasEDate,
    required dynamic purchaseorderkey,
    required int productSTypeId,
    required String producTType,
    required int quantitYTypeId,
    required String quantitYTypeName,
    required int supplieRId,
    required String supplieRName,
    required String supplieRContact,
  }) =>
      Product(
        producTId: producTId ?? this.producTId,
        producTName: producTName ?? this.producTName,
        producTCode: producTCode ?? this.producTCode,
        producTNotes: producTNotes ?? this.producTNotes,
        nOOfQuantity: nOOfQuantity ?? this.nOOfQuantity,
        producTCost: producTCost ?? this.producTCost,
        sellinGCost: sellinGCost ?? this.sellinGCost,
        purchasEDate: purchasEDate ?? this.purchasEDate,
        purchaseorderkey: purchaseorderkey ?? this.purchaseorderkey,
        productSTypeId: productSTypeId ?? this.productSTypeId,
        producTType: producTType ?? this.producTType,
        quantitYTypeId: quantitYTypeId ?? this.quantitYTypeId,
        quantitYTypeName: quantitYTypeName ?? this.quantitYTypeName,
        supplieRId: supplieRId ?? this.supplieRId,
        supplieRName: supplieRName ?? this.supplieRName,
        supplieRContact: supplieRContact ?? this.supplieRContact,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    producTId: json["producT_ID"],
    producTName: json["producT_NAME"],
    producTCode: json["producT_CODE"],
    producTNotes: json["producT_NOTES"],
    nOOfQuantity: json["nO_OF_QUANTITY"],
    producTCost: json["producT_COST"],
    sellinGCost: json["sellinG_COST"],
    purchasEDate: DateTime.parse(json["purchasE_DATE"]),
    purchaseorderkey: json["purchaseorderkey"],
    productSTypeId: json["productS_TYPE_ID"],
    producTType: json["producT_TYPE"],
    quantitYTypeId: json["quantitY_TYPE_ID"],
    quantitYTypeName: json["quantitY_TYPE_NAME"],
    supplieRId: json["supplieR_ID"],
    supplieRName: json["supplieR_NAME"],
    supplieRContact: json["supplieR_CONTACT"],
  );

  Map<String, dynamic> toMap() => {
    "producT_ID": producTId,
    "producT_NAME": producTName,
    "producT_CODE": producTCode,
    "producT_NOTES": producTNotes,
    "nO_OF_QUANTITY": nOOfQuantity,
    "producT_COST": producTCost,
    "sellinG_COST": sellinGCost,
    "purchasE_DATE": purchasEDate.toIso8601String(),
    "purchaseorderkey": purchaseorderkey,
    "productS_TYPE_ID": productSTypeId,
    "producT_TYPE": producTType,
    "quantitY_TYPE_ID": quantitYTypeId,
    "quantitY_TYPE_NAME": quantitYTypeName,
    "supplieR_ID": supplieRId,
    "supplieR_NAME": supplieRName,
    "supplieR_CONTACT": supplieRContact,
  };
}
