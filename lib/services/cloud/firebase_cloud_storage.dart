import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbro/services/cloud/cloud_exercise.dart';
import 'package:fitbro/services/cloud/cloud_training.dart';
import 'package:fitbro/tools/settings/settings.dart';

class FirebaseCloudStorage {
  final exercises = FirebaseFirestore.instance.collection('exercises');
  final training = FirebaseFirestore.instance.collection('training');

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;

  Future<CloudTraining> addTraining(
    String workoutName,
    String workoutNotes, {
    required String ownerUID,
    required Timestamp date,
    required List<CloudExercise> exercises,
  }) async {
    final document = await training.add({
      'Date': date,
      'Exercises': exercises,
      'Workout Name': workoutName,
      'uid': ownerUID,
    });
    final fetchTraining = await document.get();
    return CloudTraining(
      documentid: fetchTraining.id,
      date: date,
      exercises: exercises,
      workoutName: workoutName,
      ownerUID: ownerUID,
    );
  }

  Future<CloudExercise> addExercise(
    int distance,
    String distanceUnit,
    String notes,
    int reps,
    int seconds,
    int setOrder,
    int weight,
    String workoutName,
    String workoutNotes, {
    required String ownerUID,
    required Timestamp date,
    required String exerciseName,
  }) async {
    final weightUnit = preferences.getWeightSystem();
    final distanceUnit = preferences.getDistanceSystem();
    final document = await exercises.add({
      'Date': date,
      'Distance': distance,
      'Distance Unit': distanceUnit,
      'Exercise name': exerciseName,
      'Notes': notes,
      'Reps': reps,
      'Seconds': seconds,
      'Set order': setOrder,
      'Weight': weight,
      'Weight Unit': weightUnit,
      'Workout Name': workoutName,
      'Workout Notes': workoutNotes,
      'uid': ownerUID,
    });
    final fetchExercise = await document.get();
    return CloudExercise(
      documentid: fetchExercise.id,
      date: date,
      distance: distance,
      distanceUnit: distanceUnit,
      exerciseName: exerciseName,
      notes: notes,
      reps: reps,
      seconds: seconds,
      setOrder: setOrder,
      weight: weight,
      weightUnit: weightUnit,
      workoutName: workoutName,
      workoutNotes: workoutNotes,
      ownerUID: ownerUID,
    );
  }
}
