
class Character{
  final String Id;
  int position;
  String emotion;
  bool enlarged;
  Map<String, String> imageDict; //dicoitnary mapping emotion to imagePath
  late String imagePath;


  Character({
    required this.Id,
    required this.position,
    required this.emotion,
    required this.imageDict,
    required this.enlarged,
  }) {
    if (imageDict.containsKey(this.emotion)) {
      imagePath = imageDict[this.emotion]!;
    } else {
      imagePath = 'image does not exist';
    }

  }

  void setImagePath() {
    this.imagePath = this.imageDict[this.emotion]!;
  }

}
