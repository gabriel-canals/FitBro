import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudExercise {
  final String documentid;
  final String exerciseName;
  final String workoutName;
  final String workoutNotes;
  final String notes;
  final int setOrder;
  final int reps;
  final int seconds;
  final int weight;
  final int distance;
  final Future<String> weightUnit;
  final Future<String> distanceUnit;
  final String ownerUID;
  final Timestamp date;


  const CloudExercise({
    required this.documentid,
    required this.exerciseName,
    required this.workoutName,
    required this.workoutNotes,
    required this.notes,
    required this.setOrder,
    required this.reps,
    required this.seconds,
    required this.weight,
    required this.distance,
    required this.weightUnit,
    required this.distanceUnit,
    required this.ownerUID,
    required this.date,
  });

  CloudExercise.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) 
    : documentid = snapshot.id,
      exerciseName = snapshot.data()['Exercise name'],
      workoutName = snapshot.data()['Workout Name'],
      workoutNotes = snapshot.data()['Workout Notes'],
      notes = snapshot.data()['Notes'],
      setOrder = snapshot.data()['Set order'],
      reps = snapshot.data()['Reps'],
      seconds = snapshot.data()['Seconds'],
      weight = snapshot.data()['Weight'],
      distance = snapshot.data()['Distance'],
      weightUnit = snapshot.data()['Weight Unit'],
      distanceUnit = snapshot.data()['Distance Unit'],
      ownerUID = snapshot.data()['uid'],
      date = snapshot.data()['Date'];
}