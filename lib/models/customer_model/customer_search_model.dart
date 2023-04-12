class CustomerDTO_Input {
  String? customerName;
  String? branchName;
  String? villageName;
  String? fatherName;
  String? contactNumber;

  CustomerDTO_Input({
    this.customerName,
    this.branchName,
    this.villageName,
    this.fatherName,
    this.contactNumber,
  });

  factory CustomerDTO_Input.fromJson(Map<String, dynamic> json) {
    return CustomerDTO_Input(
      customerName: json['Customer_Name'],
      branchName: json['Branch_Name'],
      villageName: json['Village_Name'],
      fatherName: json['Father_Name'],
      contactNumber: json['Contact_Number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Customer_Name': customerName,
      'Branch_Name': branchName,
      'Village_Name': villageName,
      'Father_Name': fatherName,
      'Contact_Number': contactNumber,
    };
  }
}