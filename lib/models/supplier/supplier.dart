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
      'supplieR_ID': supplierId,
      'supplieR_NAME': supplierName,
      'adrresS1': address1,
      'adrresS2': address2,
      'contactnumber': contactNumber,
      'logourl': logoUrl,
      'pincode': pincode,
      'logicalcancel': logicalCancel,
    };
  }

  // Create a SupplierDTO object from a Map.
  static SupplierDTO fromMap(Map<String, dynamic> map) {
  return SupplierDTO(
    supplierId: map['supplieR_ID'] ?? 0,
    supplierName: map['supplieR_NAME'] ?? '',
    address1: map['adrresS1'] ?? '',
    address2: map['adrresS2'] ?? '',
    contactNumber: map['contactnumber'] ?? '',
    logoUrl: map['logourl']?? '',
    pincode: map['pincode']?? '',
    logicalCancel: map['logicalcancel'] ?? false,
  );
  }
}
