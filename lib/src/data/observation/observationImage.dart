// 観察画像テーブル
import 'package:drift/drift.dart';

class ObservationImage extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get observation_id => integer().named('観察ID')();
  TextColumn get image_name => text().named('ファイル名')();
}
