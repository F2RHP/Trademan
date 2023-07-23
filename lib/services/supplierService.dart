import 'dart:async';

import 'package:trader_app/services/servicebase.dart';

import '../models/supplier/supplier.dart';

class SupplierService extends BaseService {
  // Simulate an API call to get a list of suppliers.
  Future<List<SupplierDTO>> getSuppliers() async {
    // Simulate an API delay of 2 seconds using Future.delayed.
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual API call to fetch the supplier list.
    // For now, we'll return a mockup list of suppliers.
    return [
      SupplierDTO(
        supplierId: 1,
        supplierName: "Supplier 1",
        address1: "Address 1",
        address2: "Address 2",
        contactNumber: "1234567890",
        logoUrl: "https://example.com/logo1.png",
        pincode: "12345",
        logicalCancel: false,
      ),
      SupplierDTO(
        supplierId: 2,
        supplierName: "Supplier 2",
        address1: "Address 3",
        address2: "Address 4",
        contactNumber: "9876543210",
        logoUrl: "https://example.com/logo2.png",
        pincode: "67890",
        logicalCancel: true,
      ),
      // Add more suppliers here...
    ];
  }
}
