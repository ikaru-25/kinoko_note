import "package:drift/drift.dart";
import "package:drift/native.dart";
// import 'package:kinoko_note/interfaces/observation.interface.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path/path.dart';
import '../domain/observationn/observation.interface.dart';
import 'observation/observation.dart';
import 'observation/observationImage.dart';
part 'db.g.dart';
// part 'observation/observation.repository.dart';

class ObservationWithImage {
  // final Observation observation;
  // final ObservationImage image;
  final observation;
  final image;

  ObservationWithImage(this.observation, this.image);
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

  Stream<List<ObservationWithImage>> observationWithImage2(int observationId) {
    final query =
        (select(observation)..where((o) => o.id.equals(observationId))).join([
      leftOuterJoin(observationImage,
          observationImage.observation_id.equalsExp(observation.id)),
    ]);
    return query.watch().map((rows) {
      return rows.map((row) {
        return ObservationWithImage(observation, observationImage
            // row.readTable(observation),
            // row.readTable(observationImage),
            );
      }).toList();
    });
  }

  Future<List<ObservationWithImage>> observationWithImage(
      int observationId) async {
    final query = await (select(observation)
          ..where((o) => o.id.equals(observationId)))
        .join([
      leftOuterJoin(observationImage,
          observationImage.observation_id.equalsExp(observation.id)),
    ]);

    final typedResult = await query.get();
    List<ObservationWithImage> observationWithImage = [];

    for (var row in typedResult) {
      observationWithImage.add(ObservationWithImage(
          row.readTable(observation), row.readTable(observationImage)));
    }
    // observationWithImage = typedResult.map((row) {
    //   return ObservationWithImage(row.readTable(observation), row.readTable(observationImage));
    // })

    return observationWithImage;

    // query.map((row) {
    //   return ObservationWithImage(
    //       row.readTable(observation
    //           as ResultSetImplementation<$ObservationTable, Observation>),
    //       row.readTable(observationImage as ResultSetImplementation<
    //           $ObservationImageTable, ObservationImage>));
    // });
    // return t;
  }

  // Future<int> addObservation(String name, DateTime observationDate) {
  //   return into(observation).insert(ObservationCompanion(
  //       name: Value(name), observation_date: Value(observationDate)));
  // }

  Future<int> addObservation(IObservation createObservationData) {
    return into(observation).insert(ObservationCompanion(
        name: Value(createObservationData.name),
        observation_date: Value(createObservationData.observation_date)));
  }

  // 観察記録に紐づく画像をまとめて保存する。
  // TOOO: まとめてINSERTする方法
  Future<void> addImages(int observationId, List<String>? imageNames) async {
    imageNames = imageNames ?? [];

    imageNames.forEach((name) {
      into(observationImage).insert(ObservationImageCompanion(
          observation_id: Value(observationId),
          image_name: Value(basename(name))));
    });
    return;
  }
}
