import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbro/services/cloud/cloud_exercise.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudTraining {
  final String documentid;
  final String workoutName;
  final String ownerUID;
  final Timestamp date;
  final List<CloudExercise> exercises;

  const CloudTraining({
    required this.documentid,
    required this.workoutName,
    required this.ownerUID,
    required this.date,
    required this.exercises,
  });

  CloudTraining.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) 
    : documentid = snapshot.id,
      workoutName = snapshot.data()['Workout Name'],
      ownerUID = snapshot.data()['uid'],
      date = snapshot.data()['Date'],
      exercises = snapshot.data()['Exercises'];
}