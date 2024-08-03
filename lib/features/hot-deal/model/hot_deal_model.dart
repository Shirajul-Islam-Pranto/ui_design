class TodaysDeal {
  String id;
  String title;
  String description;
  double discount;
  DateTime startDate;
  DateTime endDate;
  bool isActive;
  String ?imageUrl,shopLogo,shopName;


  // Constructor
  TodaysDeal({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.imageUrl,this.shopLogo,this.shopName
  });


}