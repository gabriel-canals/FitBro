import 'package:fitbro/constants/exercise_categories.dart';

class Exercise {
  late String name;
  late String category;
  late String bodyPart;
  late int id;

  Exercise(this.name, this.category, this.bodyPart, this.id) {
    if (categories.contains(category) == false) throw Exception("Ups");
    if (partOfBody.contains(bodyPart) == false) throw Exception("Ups");
  }

  String get getName => name;
  String get getCategory => category;
  String get getBodyPart => bodyPart;
  int get getID => id;
}
