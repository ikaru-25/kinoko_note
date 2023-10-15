// 観察テーブル
import 'package:drift/drift.dart';

class Observation extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('キノコの名前')();
  DateTimeColumn get observation_date => dateTime().named('観察日')();
  IntColumn get medium => integer().nullable().named('発生場所')();
  IntColumn get cortex_reverse => integer().nullable().named('傘裏の形状')();
  BoolColumn get volva => boolean().nullable().named('つぼ')();
  BoolColumn get collar => boolean().nullable().named('つば')();
}
