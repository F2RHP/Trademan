class SupplierDTO {
  int supplierId;
  String supplierName;
  String address1;
  String address2;
  String contactNumber;
  String logoUrl;
  String pincode;
  bool? logicalCancel;

  SupplierDTO({
    required this.supplierId,
    required this.supplierName,
    required this.address1,
    required this.address2,
    required this.contactNumber,
    required this.logoUrl,
    required this.pincode,
    this.logicalCancel,
  });

  // Convert the SupplierDTO object to a Map.
  Map<String, dynamic> toMap() {
    return {
      'SUPPLIER_ID': supplierId,
      'SUPPLIER_NAME': supplierName,
      'ADRRESS1': address1,
      'ADDRESS2': address2,
      'CONTACTNUMBER': contactNumber,
      'LOGOURL': logoUrl,
      'PINCODE': pincode,
      'LOGICALCANCEL': logicalCancel,
    };
  }

  // Create a SupplierDTO object from a Map.
  static SupplierDTO fromMap(Map<String, dynamic> map) {
    return SupplierDTO(
      supplierId: map['SUPPLIER_ID'],
      supplierName: map['SUPPLIER_NAME'],
      address1: map['ADRRESS1'],
      address2: map['ADDRESS2'],
      contactNumber: map['CONTACTNUMBER'],
      logoUrl: map['LOGOURL'],
      pincode: map['PINCODE'],
      logicalCancel: map['LOGICALCANCEL'],
    );
  }
}
