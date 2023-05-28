import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomerDTO_UPD {
  int? customerId;
  String? customerName;
  String? customerNickname;
  String? fatherName;
  String? address1;
  String? address2;
  String? villageName;
  String? pincode;
  String? contactNumber;
  String? email;
  String? gender;
  DateTime? dob;
  String? profilePictureUrl;
  String? customerNotes;
  bool logicalCancel = false;
  int? branchId;

  CustomerDTO_UPD({
    this.customerId,
    this.customerName,
    this.customerNickname,
    this.fatherName,
    this.address1,
    this.address2,
    this.villageName,
    this.pincode,
    this.contactNumber,
    this.email,
    this.gender,
    this.dob,
    this.profilePictureUrl,
    this.customerNotes,
    this.logicalCancel = false,
    this.branchId,
  });

  Map<String, dynamic> toJson() {
    return {
      'CustomerId': customerId,
      'CustomerName': customerName,
      'CustomerNickname': customerNickname,
      'FatherName': fatherName,
      'Address1': address1,
      'Address2': address2,
      'VillageName': villageName,
      'Pincode': pincode,
      'ContactNumber': contactNumber,
      'Email': email,
      'Gender': gender,
      'Dob': dob?.toIso8601String(),
      'ProfilePictureUrl': profilePictureUrl,
      'CustomerNotes': customerNotes,
      'LogicalCancel': logicalCancel,
      'BranchId': branchId,
    };
  }
}


