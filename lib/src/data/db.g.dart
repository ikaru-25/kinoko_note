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
  final int? medium;
  final int? cortex_reverse;
  final bool? volva;
  final bool? collar;
  ObservationData(
      {required this.id,
      required this.name,
      required this.observation_date,
      this.medium,
      this.cortex_reverse,
      this.volva,
      this.collar});
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
      medium: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}発生場所']),
      cortex_reverse: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}傘裏の形状']),
      volva: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}つぼ']),
      collar: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}つば']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['キノコの名前'] = Variable<String>(name);
    map['観察日'] = Variable<DateTime>(observation_date);
    if (!nullToAbsent || medium != null) {
      map['発生場所'] = Variable<int?>(medium);
    }
    if (!nullToAbsent || cortex_reverse != null) {
      map['傘裏の形状'] = Variable<int?>(cortex_reverse);
    }
    if (!nullToAbsent || volva != null) {
      map['つぼ'] = Variable<bool?>(volva);
    }
    if (!nullToAbsent || collar != null) {
      map['つば'] = Variable<bool?>(collar);
    }
    return map;
  }

  ObservationCompanion toCompanion(bool nullToAbsent) {
    return ObservationCompanion(
      id: Value(id),
      name: Value(name),
      observation_date: Value(observation_date),
      medium:
          medium == null && nullToAbsent ? const Value.absent() : Value(medium),
      cortex_reverse: cortex_reverse == null && nullToAbsent
          ? const Value.absent()
          : Value(cortex_reverse),
      volva:
          volva == null && nullToAbsent ? const Value.absent() : Value(volva),
      collar:
          collar == null && nullToAbsent ? const Value.absent() : Value(collar),
    );
  }

  factory ObservationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObservationData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      observation_date: serializer.fromJson<DateTime>(json['observation_date']),
      medium: serializer.fromJson<int?>(json['medium']),
      cortex_reverse: serializer.fromJson<int?>(json['cortex_reverse']),
      volva: serializer.fromJson<bool?>(json['volva']),
      collar: serializer.fromJson<bool?>(json['collar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'observation_date': serializer.toJson<DateTime>(observation_date),
      'medium': serializer.toJson<int?>(medium),
      'cortex_reverse': serializer.toJson<int?>(cortex_reverse),
      'volva': serializer.toJson<bool?>(volva),
      'collar': serializer.toJson<bool?>(collar),
    };
  }

  ObservationData copyWith(
          {int? id,
          String? name,
          DateTime? observation_date,
          int? medium,
          int? cortex_reverse,
          bool? volva,
          bool? collar}) =>
      ObservationData(
        id: id ?? this.id,
        name: name ?? this.name,
        observation_date: observation_date ?? this.observation_date,
        medium: medium ?? this.medium,
        cortex_reverse: cortex_reverse ?? this.cortex_reverse,
        volva: volva ?? this.volva,
        collar: collar ?? this.collar,
      );
  @override
  String toString() {
    return (StringBuffer('ObservationData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('observation_date: $observation_date, ')
          ..write('medium: $medium, ')
          ..write('cortex_reverse: $cortex_reverse, ')
          ..write('volva: $volva, ')
          ..write('collar: $collar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, observation_date, medium, cortex_reverse, volva, collar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationData &&
          other.id == this.id &&
          other.name == this.name &&
          other.observation_date == this.observation_date &&
          other.medium == this.medium &&
          other.cortex_reverse == this.cortex_reverse &&
          other.volva == this.volva &&
          other.collar == this.collar);
}

class ObservationCompanion extends UpdateCompanion<ObservationData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> observation_date;
  final Value<int?> medium;
  final Value<int?> cortex_reverse;
  final Value<bool?> volva;
  final Value<bool?> collar;
  const ObservationCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.observation_date = const Value.absent(),
    this.medium = const Value.absent(),
    this.cortex_reverse = const Value.absent(),
    this.volva = const Value.absent(),
    this.collar = const Value.absent(),
  });
  ObservationCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime observation_date,
    this.medium = const Value.absent(),
    this.cortex_reverse = const Value.absent(),
    this.volva = const Value.absent(),
    this.collar = const Value.absent(),
  })  : name = Value(name),
        observation_date = Value(observation_date);
  static Insertable<ObservationData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? observation_date,
    Expression<int?>? medium,
    Expression<int?>? cortex_reverse,
    Expression<bool?>? volva,
    Expression<bool?>? collar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'キノコの名前': name,
      if (observation_date != null) '観察日': observation_date,
      if (medium != null) '発生場所': medium,
      if (cortex_reverse != null) '傘裏の形状': cortex_reverse,
      if (volva != null) 'つぼ': volva,
      if (collar != null) 'つば': collar,
    });
  }

  ObservationCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? observation_date,
      Value<int?>? medium,
      Value<int?>? cortex_reverse,
      Value<bool?>? volva,
      Value<bool?>? collar}) {
    return ObservationCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      observation_date: observation_date ?? this.observation_date,
      medium: medium ?? this.medium,
      cortex_reverse: cortex_reverse ?? this.cortex_reverse,
      volva: volva ?? this.volva,
      collar: collar ?? this.collar,
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
    if (medium.present) {
      map['発生場所'] = Variable<int?>(medium.value);
    }
    if (cortex_reverse.present) {
      map['傘裏の形状'] = Variable<int?>(cortex_reverse.value);
    }
    if (volva.present) {
      map['つぼ'] = Variable<bool?>(volva.value);
    }
    if (collar.present) {
      map['つば'] = Variable<bool?>(collar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObservationCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('observation_date: $observation_date, ')
          ..write('medium: $medium, ')
          ..write('cortex_reverse: $cortex_reverse, ')
          ..write('volva: $volva, ')
          ..write('collar: $collar')
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
  final VerificationMeta _mediumMeta = const VerificationMeta('medium');
  @override
  late final GeneratedColumn<int?> medium = GeneratedColumn<int?>(
      '発生場所', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _cortex_reverseMeta =
      const VerificationMeta('cortex_reverse');
  @override
  late final GeneratedColumn<int?> cortex_reverse = GeneratedColumn<int?>(
      '傘裏の形状', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _volvaMeta = const VerificationMeta('volva');
  @override
  late final GeneratedColumn<bool?> volva = GeneratedColumn<bool?>(
      'つぼ', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("つぼ" IN (0, 1))');
  final VerificationMeta _collarMeta = const VerificationMeta('collar');
  @override
  late final GeneratedColumn<bool?> collar = GeneratedColumn<bool?>(
      'つば', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("つば" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, observation_date, medium, cortex_reverse, volva, collar];
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
    if (data.containsKey('発生場所')) {
      context.handle(_mediumMeta,
          medium.isAcceptableOrUnknown(data['発生場所']!, _mediumMeta));
    }
    if (data.containsKey('傘裏の形状')) {
      context.handle(
          _cortex_reverseMeta,
          cortex_reverse.isAcceptableOrUnknown(
              data['傘裏の形状']!, _cortex_reverseMeta));
    }
    if (data.containsKey('つぼ')) {
      context.handle(
          _volvaMeta, volva.isAcceptableOrUnknown(data['つぼ']!, _volvaMeta));
    }
    if (data.containsKey('つば')) {
      context.handle(
          _collarMeta, collar.isAcceptableOrUnknown(data['つば']!, _collarMeta));
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
