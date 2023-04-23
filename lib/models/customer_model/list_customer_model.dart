// To parse this JSON data, do
//
//     final customersList = customersListFromMap(jsonString);

import 'dart:convert';

CustomersList customersListFromMap(String str) => CustomersList.fromMap(json.decode(str));

String customersListToMap(CustomersList data) => json.encode(data.toMap());

class CustomersList {
    CustomersList({
        this.customeRId,
        this.customeRName,
        this.customeRNickname,
        this.fatheRName,
        this.villagename,
        this.contactnumber,
        this.customeRNotes,
        this.brancHId,
        this.brancHName,
        this.brancHContact,
        this.organisatioNId,
        this.organisatioNName,
        this.organisatioNContact,
        this.adrresS1,
        this.addresS2,
        this.gender,
        this.pincode,
        this.dob,
        this.email,
    });

    int? customeRId;
    String? customeRName;
    String? customeRNickname;
    String? fatheRName;
    String? villagename;
    dynamic contactnumber;
    String? customeRNotes;
    int? brancHId;
    String? brancHName;
    String? brancHContact;
    int? organisatioNId;
    String? organisatioNName;
    String? organisatioNContact;
    String? adrresS1;
    String? addresS2;
    String? gender;
    String? pincode;
    dynamic dob;
    String? email;

    factory CustomersList.fromMap(Map<String, dynamic> json) => CustomersList(
        customeRId: json["customeR_ID"],
        customeRName: json["customeR_NAME"],
        customeRNickname: json["customeR_NICKNAME"],
        fatheRName: json["fatheR_NAME"],
        villagename: json["villagename"],
        contactnumber: json["contactnumber"],
        customeRNotes: json["customeR_NOTES"],
        brancHId: json["brancH_ID"],
        brancHName: json["brancH_NAME"],
        brancHContact: json["brancH_CONTACT"],
        organisatioNId: json["organisatioN_ID"],
        organisatioNName: json["organisatioN_NAME"],
        organisatioNContact: json["organisatioN_CONTACT"],
        adrresS1: json["adrresS1"],
        addresS2: json["addresS2"],
        gender: json["gender"],
        pincode: json["pincode"],
        dob: json["dob"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "customeR_ID": customeRId,
        "customeR_NAME": customeRName,
        "customeR_NICKNAME": customeRNickname,
        "fatheR_NAME": fatheRName,
        "villagename": villagename,
        "contactnumber": contactnumber,
        "customeR_NOTES": customeRNotes,
        "brancH_ID": brancHId,
        "brancH_NAME": brancHName,
        "brancH_CONTACT": brancHContact,
        "organisatioN_ID": organisatioNId,
        "organisatioN_NAME": organisatioNName,
        "organisatioN_CONTACT": organisatioNContact,
        "adrresS1": adrresS1,
        "addresS2": addresS2,
        "gender": gender,
        "pincode": pincode,
        "dob": dob,
        "email": email,
    };
}
