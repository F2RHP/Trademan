class SaleCustomer {
  int customerID;
  String customerName;
  String customerNickname;
  String fatherName;
  String villageName;
  String contactNumber;

  SaleCustomer({
    required this.customerID,
    required this.customerName,
    required this.customerNickname,
    required this.fatherName,
    required this.villageName,
    required this.contactNumber,
  });

  factory SaleCustomer.fromMap(Map<String, dynamic> map) {
    return SaleCustomer(
      customerID: map['customeR_ID'],
      customerName: map['customeR_NAME'],
      customerNickname: map['customeR_NICKNAME'],
      fatherName: map['fatheR_NAME'],
      villageName: map['villagename'],
      contactNumber: map['contactnumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customeR_ID': customerID,
      'customeR_NAME': customerName,
      'customeR_NICKNAME': customerNickname,
      'fatheR_NAME': fatherName,
      'villagename': villageName,
      'contactnumber': contactNumber,
    };
  }
}

