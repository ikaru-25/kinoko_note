import "package:drift/drift.dart";
import "package:drift/native.dart";
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
// part 'package:kinoko_note/model/observation.g.dart';
part 'db.g.dart';

// 観察テーブル
class Observation extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('キノコの名前')();
  DateTimeColumn get observation_date => dateTime().named('観察日')();
}

// 観察画像テーブル
class ObservationImage extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get observation_id => integer().named('観察ID')();
  TextColumn get image_name => text().named('ファイル名')();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Observation, ObservationImage])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ObservationData>> get allObservationEntries =>
      select(observation).get();

  Future<int> addObservation(String name, DateTime observationDate) {
    return into(observation).insert(ObservationCompanion(
        name: Value(name), observation_date: Value(observationDate)));
  }

  // 観察記録に紐づく画像をまとめて保存する。
  // TOOO: まとめてINSERTする方法
  Future<void> addImages(int observationId, List<String>? imageNames) async {
    imageNames = imageNames ?? [];

    imageNames.forEach((name) {
      into(observationImage).insert(ObservationImageCompanion(
          observation_id: Value(observationId), image_name: Value(name)));
    });
    return;
  }
}
