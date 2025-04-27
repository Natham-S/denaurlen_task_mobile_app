class PostData {
  final int netCoins;
  final int grossCoins;
  final String leadUser;
  final DateTime createdAt;  // ⬅️ New field

  PostData({
    required this.netCoins,
    required this.grossCoins,
    required this.leadUser,
    required this.createdAt,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      netCoins: json['netCoins'],
      grossCoins: json['grossCoins'],
      leadUser: json['leadUser'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
