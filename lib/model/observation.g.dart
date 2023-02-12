// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ObservationData extends DataClass implements Insertable<ObservationData> {
  final int id;
  final String name;
  final String image_name;
  ObservationData(
      {required this.id, required this.name, required this.image_name});
  factory ObservationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ObservationData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}キノコの名前'])!,
      image_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}画像ファイル名'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['キノコの名前'] = Variable<String>(name);
    map['画像ファイル名'] = Variable<String>(image_name);
    return map;
  }

  ObservationCompanion toCompanion(bool nullToAbsent) {
    return ObservationCompanion(
      id: Value(id),
      name: Value(name),
      image_name: Value(image_name),
    );
  }

  factory ObservationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObservationData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image_name: serializer.fromJson<String>(json['image_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image_name': serializer.toJson<String>(image_name),
    };
  }

  ObservationData copyWith({int? id, String? name, String? image_name}) =>
      ObservationData(
        id: id ?? this.id,
        name: name ?? this.name,
        image_name: image_name ?? this.image_name,
      );
  @override
  String toString() {
    return (StringBuffer('ObservationData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image_name: $image_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image_name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image_name == this.image_name);
}

class ObservationCompanion extends UpdateCompanion<ObservationData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image_name;
  const ObservationCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image_name = const Value.absent(),
  });
  ObservationCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image_name,
  })  : name = Value(name),
        image_name = Value(image_name);
  static Insertable<ObservationData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image_name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'キノコの名前': name,
      if (image_name != null) '画像ファイル名': image_name,
    });
  }

  ObservationCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? image_name}) {
    return ObservationCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image_name: image_name ?? this.image_name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['キノコの名前'] = Variable<String>(name.value);
    }
    if (image_name.present) {
      map['画像ファイル名'] = Variable<String>(image_name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObservationCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image_name: $image_name')
          ..write(')'))
        .toString();
  }
}

class $ObservationTable extends Observation
    with TableInfo<$ObservationTable, ObservationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObservationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'キノコの名前', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _image_nameMeta = const VerificationMeta('image_name');
  @override
  late final GeneratedColumn<String?> image_name = GeneratedColumn<String?>(
      '画像ファイル名', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, image_name];
  @override
  String get aliasedName => _alias ?? 'observation';
  @override
  String get actualTableName => 'observation';
  @override
  VerificationContext validateIntegrity(Insertable<ObservationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('キノコの名前')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['キノコの名前']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('画像ファイル名')) {
      context.handle(_image_nameMeta,
          image_name.isAcceptableOrUnknown(data['画像ファイル名']!, _image_nameMeta));
    } else if (isInserting) {
      context.missing(_image_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObservationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ObservationData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ObservationTable createAlias(String alias) {
    return $ObservationTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ObservationTable observation = $ObservationTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [observation];
}
