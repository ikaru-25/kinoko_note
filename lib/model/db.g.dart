// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ObservationData extends DataClass implements Insertable<ObservationData> {
  final int id;
  final String name;
  final DateTime observation_date;
  ObservationData(
      {required this.id, required this.name, required this.observation_date});
  factory ObservationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ObservationData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}キノコの名前'])!,
      observation_date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}観察日'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['キノコの名前'] = Variable<String>(name);
    map['観察日'] = Variable<DateTime>(observation_date);
    return map;
  }

  ObservationCompanion toCompanion(bool nullToAbsent) {
    return ObservationCompanion(
      id: Value(id),
      name: Value(name),
      observation_date: Value(observation_date),
    );
  }

  factory ObservationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObservationData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      observation_date: serializer.fromJson<DateTime>(json['observation_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'observation_date': serializer.toJson<DateTime>(observation_date),
    };
  }

  ObservationData copyWith(
          {int? id, String? name, DateTime? observation_date}) =>
      ObservationData(
        id: id ?? this.id,
        name: name ?? this.name,
        observation_date: observation_date ?? this.observation_date,
      );
  @override
  String toString() {
    return (StringBuffer('ObservationData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('observation_date: $observation_date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, observation_date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationData &&
          other.id == this.id &&
          other.name == this.name &&
          other.observation_date == this.observation_date);
}

class ObservationCompanion extends UpdateCompanion<ObservationData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> observation_date;
  const ObservationCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.observation_date = const Value.absent(),
  });
  ObservationCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime observation_date,
  })  : name = Value(name),
        observation_date = Value(observation_date);
  static Insertable<ObservationData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? observation_date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'キノコの名前': name,
      if (observation_date != null) '観察日': observation_date,
    });
  }

  ObservationCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? observation_date}) {
    return ObservationCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      observation_date: observation_date ?? this.observation_date,
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
    if (observation_date.present) {
      map['観察日'] = Variable<DateTime>(observation_date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObservationCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('observation_date: $observation_date')
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
  final VerificationMeta _observation_dateMeta =
      const VerificationMeta('observation_date');
  @override
  late final GeneratedColumn<DateTime?> observation_date =
      GeneratedColumn<DateTime?>('観察日', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, observation_date];
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
    if (data.containsKey('観察日')) {
      context.handle(
          _observation_dateMeta,
          observation_date.isAcceptableOrUnknown(
              data['観察日']!, _observation_dateMeta));
    } else if (isInserting) {
      context.missing(_observation_dateMeta);
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

class ObservationImageData extends DataClass
    implements Insertable<ObservationImageData> {
  final int id;
  final int observation_id;
  final String image_name;
  ObservationImageData(
      {required this.id,
      required this.observation_id,
      required this.image_name});
  factory ObservationImageData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ObservationImageData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      observation_id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}観察ID'])!,
      image_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ファイル名'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['観察ID'] = Variable<int>(observation_id);
    map['ファイル名'] = Variable<String>(image_name);
    return map;
  }

  ObservationImageCompanion toCompanion(bool nullToAbsent) {
    return ObservationImageCompanion(
      id: Value(id),
      observation_id: Value(observation_id),
      image_name: Value(image_name),
    );
  }

  factory ObservationImageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObservationImageData(
      id: serializer.fromJson<int>(json['id']),
      observation_id: serializer.fromJson<int>(json['observation_id']),
      image_name: serializer.fromJson<String>(json['image_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'observation_id': serializer.toJson<int>(observation_id),
      'image_name': serializer.toJson<String>(image_name),
    };
  }

  ObservationImageData copyWith(
          {int? id, int? observation_id, String? image_name}) =>
      ObservationImageData(
        id: id ?? this.id,
        observation_id: observation_id ?? this.observation_id,
        image_name: image_name ?? this.image_name,
      );
  @override
  String toString() {
    return (StringBuffer('ObservationImageData(')
          ..write('id: $id, ')
          ..write('observation_id: $observation_id, ')
          ..write('image_name: $image_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, observation_id, image_name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationImageData &&
          other.id == this.id &&
          other.observation_id == this.observation_id &&
          other.image_name == this.image_name);
}

class ObservationImageCompanion extends UpdateCompanion<ObservationImageData> {
  final Value<int> id;
  final Value<int> observation_id;
  final Value<String> image_name;
  const ObservationImageCompanion({
    this.id = const Value.absent(),
    this.observation_id = const Value.absent(),
    this.image_name = const Value.absent(),
  });
  ObservationImageCompanion.insert({
    this.id = const Value.absent(),
    required int observation_id,
    required String image_name,
  })  : observation_id = Value(observation_id),
        image_name = Value(image_name);
  static Insertable<ObservationImageData> custom({
    Expression<int>? id,
    Expression<int>? observation_id,
    Expression<String>? image_name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (observation_id != null) '観察ID': observation_id,
      if (image_name != null) 'ファイル名': image_name,
    });
  }

  ObservationImageCompanion copyWith(
      {Value<int>? id, Value<int>? observation_id, Value<String>? image_name}) {
    return ObservationImageCompanion(
      id: id ?? this.id,
      observation_id: observation_id ?? this.observation_id,
      image_name: image_name ?? this.image_name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (observation_id.present) {
      map['観察ID'] = Variable<int>(observation_id.value);
    }
    if (image_name.present) {
      map['ファイル名'] = Variable<String>(image_name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObservationImageCompanion(')
          ..write('id: $id, ')
          ..write('observation_id: $observation_id, ')
          ..write('image_name: $image_name')
          ..write(')'))
        .toString();
  }
}

class $ObservationImageTable extends ObservationImage
    with TableInfo<$ObservationImageTable, ObservationImageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObservationImageTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _observation_idMeta =
      const VerificationMeta('observation_id');
  @override
  late final GeneratedColumn<int?> observation_id = GeneratedColumn<int?>(
      '観察ID', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _image_nameMeta = const VerificationMeta('image_name');
  @override
  late final GeneratedColumn<String?> image_name = GeneratedColumn<String?>(
      'ファイル名', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, observation_id, image_name];
  @override
  String get aliasedName => _alias ?? 'observation_image';
  @override
  String get actualTableName => 'observation_image';
  @override
  VerificationContext validateIntegrity(
      Insertable<ObservationImageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('観察ID')) {
      context.handle(
          _observation_idMeta,
          observation_id.isAcceptableOrUnknown(
              data['観察ID']!, _observation_idMeta));
    } else if (isInserting) {
      context.missing(_observation_idMeta);
    }
    if (data.containsKey('ファイル名')) {
      context.handle(_image_nameMeta,
          image_name.isAcceptableOrUnknown(data['ファイル名']!, _image_nameMeta));
    } else if (isInserting) {
      context.missing(_image_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObservationImageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ObservationImageData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ObservationImageTable createAlias(String alias) {
    return $ObservationImageTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ObservationTable observation = $ObservationTable(this);
  late final $ObservationImageTable observationImage =
      $ObservationImageTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [observation, observationImage];
}
