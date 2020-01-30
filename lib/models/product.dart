class ProductResponse{
  int success;
  List<Product> data;

  ProductResponse({this.success,this.data});

  factory ProductResponse.fromJson(Map<String,dynamic> parsedJson){
    var list=parsedJson['data'] as List;
    List<Product> productList=list.map((i)=>Product.fromJson(i)).toList();

    return ProductResponse(
      success: parsedJson['success'],
      data: productList
    );
  }

  /*Product({this.id, this.name, this.images});

  factory Product.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['images'] as List;
    print(list.runtimeType);
    List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();


    return Product(
        id: parsedJson['id'],
        name: parsedJson['name'],
        images: imagesList

    );
  }*/

}
class Product{

  Product({this.id,this.name,this.image,this.price_formated});

  factory Product.fromJson(Map<String, dynamic> parsedJson){
    return Product(
      id: parsedJson['id'],
      name: parsedJson['name'],
      image: parsedJson['image'],
      price_formated: parsedJson['price_formated']
    );
  }

  int id;
  int product_id;
  String name;
  String manufacturer;
  String sku;
  String model;
  String image;
  List<String> images;
  List<String> original_images;
  String original_image;
  double price_excluding_tax;
  double price;
  String price_excluding_tax_formated;
  String special_excluding_tax_formated;
  String special_formated;
  String price_formated;
  int rating;
  String description;
  String special_start_date;
  String special_end_date;
  String minimum;
  String meta_title;
  int special;
  int special_excluding_tax;
  int meta_description;
  int meta_keyword;
  int stock_status;
}