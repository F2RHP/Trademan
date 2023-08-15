class ProductObject {
  int PRODUCT_ID;
  String PRODUCT_NAME;
  int PRODUCTS_TYPE_ID;
  int QUANTITY_TYPE_ID;
  String PRODUCT_CODE;
  String PRODUCT_DESCRIPTION;
  String NOTES;
  String PRODUCT_IMAGE_URL;
  bool LOGICALCANCEL;

  ProductObject({
    this.PRODUCT_ID = 0,
    this.PRODUCT_NAME = '',
    this.PRODUCTS_TYPE_ID = 0,
    this.QUANTITY_TYPE_ID = 0,
    this.PRODUCT_CODE = '',
    this.PRODUCT_DESCRIPTION = '',
    this.NOTES = '',
    this.PRODUCT_IMAGE_URL = '',
    this.LOGICALCANCEL = false,
  });

  factory ProductObject.fromMap(Map<String, dynamic> map) {
    return ProductObject(
      PRODUCT_ID: map['PRODUCT_ID'] ?? 0,
      PRODUCT_NAME: map['PRODUCT_NAME'] ?? '',
      PRODUCTS_TYPE_ID: map['PRODUCTS_TYPE_ID'] ?? 0,
      QUANTITY_TYPE_ID: map['QUANTITY_TYPE_ID'] ?? 0,
      PRODUCT_CODE: map['PRODUCT_CODE'] ?? '',
      PRODUCT_DESCRIPTION: map['PRODUCT_DESCRIPTION'] ?? '',
      NOTES: map['NOTES'] ?? '',
      PRODUCT_IMAGE_URL: map['PRODUCT_IMAGE_URL'] ?? '',
      LOGICALCANCEL: map['LOGICALCANCEL'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'PRODUCT_ID': PRODUCT_ID,
      'PRODUCT_NAME': PRODUCT_NAME,
      'PRODUCTS_TYPE_ID': PRODUCTS_TYPE_ID,
      'QUANTITY_TYPE_ID': QUANTITY_TYPE_ID,
      'PRODUCT_CODE': PRODUCT_CODE,
      'PRODUCT_DESCRIPTION': PRODUCT_DESCRIPTION,
      'NOTES': NOTES,
      'PRODUCT_IMAGE_URL': PRODUCT_IMAGE_URL,
      'LOGICALCANCEL': LOGICALCANCEL,
    };
  }
}
