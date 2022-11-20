class Cat {
  final int id;
  final String name;
  final String description;
  final String place;
  final int reward;
  final String userId;
  final int date;
  final String? pictureUrl;

  const Cat({
    required this.id,
    required this.name,
    required this.description,
    required this.place,
    required this.reward,
    required this.userId,
    required this.date,
    required this.pictureUrl
  });

  Map toJson() =>{
    "id": 0,
    "name": name,
    "description": description,
    "place": place,
    "reward": reward,
    "userId": userId,
    "date": date,
    "pictureUrl": pictureUrl
  };

  @override
  String toString(){
    return 'Id: ' + id.toString() + ', Name: ' + name + ', Description: ' + description + ', Place: ' + place + ', Reward: ' + reward.toString() + ', User Id: ' + userId + ', Date: ' + date.toString() + ', Picture Url: ' + (pictureUrl == null ? 'null' : pictureUrl!);
  }
}