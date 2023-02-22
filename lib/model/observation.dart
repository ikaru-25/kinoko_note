// import "package:drift/drift.dart";
// import "package:drift/native.dart";
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:path/path.dart' as p;
// part 'observation.g.dart';

// class Observation extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().named('キノコの名前')();
//   // TextColumn get name => text().named('キノコの名前')();
// }

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
// }

// @DriftDatabase(tables: [Observation])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;

//   Future<List<ObservationData>> get allObservationEntries =>
//       select(observation).get();

//   Future<int> addObservation(String name, String image_name) {
//     return into(observation).insert(
//         ObservationCompanion(name: Value(name), image_name: Value(image_name)));
//   }
// }
