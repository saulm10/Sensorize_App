// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'silos.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSilosCollection on Isar {
  IsarCollection<Silos> get silos => this.collection();
}

const SilosSchema = CollectionSchema(
  name: r'Silos',
  id: -8412791901242536629,
  properties: {
    r'altura': PropertySchema(
      id: 0,
      name: r'altura',
      type: IsarType.long,
    ),
    r'idSensor': PropertySchema(
      id: 1,
      name: r'idSensor',
      type: IsarType.string,
    ),
    r'idSilo': PropertySchema(
      id: 2,
      name: r'idSilo',
      type: IsarType.string,
    ),
    r'mediciones': PropertySchema(
      id: 3,
      name: r'mediciones',
      type: IsarType.objectList,
      target: r'Mediciones',
    ),
    r'nombre': PropertySchema(
      id: 4,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'riesgo': PropertySchema(
      id: 5,
      name: r'riesgo',
      type: IsarType.long,
    ),
    r'volumen': PropertySchema(
      id: 6,
      name: r'volumen',
      type: IsarType.long,
    )
  },
  estimateSize: _silosEstimateSize,
  serialize: _silosSerialize,
  deserialize: _silosDeserialize,
  deserializeProp: _silosDeserializeProp,
  idName: r'id_',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Mediciones': MedicionesSchema},
  getId: _silosGetId,
  getLinks: _silosGetLinks,
  attach: _silosAttach,
  version: '3.1.0+1',
);

int _silosEstimateSize(
  Silos object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idSensor.length * 3;
  bytesCount += 3 + object.idSilo.length * 3;
  bytesCount += 3 + object.mediciones.length * 3;
  {
    final offsets = allOffsets[Mediciones]!;
    for (var i = 0; i < object.mediciones.length; i++) {
      final value = object.mediciones[i];
      bytesCount += MedicionesSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  return bytesCount;
}

void _silosSerialize(
  Silos object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.altura);
  writer.writeString(offsets[1], object.idSensor);
  writer.writeString(offsets[2], object.idSilo);
  writer.writeObjectList<Mediciones>(
    offsets[3],
    allOffsets,
    MedicionesSchema.serialize,
    object.mediciones,
  );
  writer.writeString(offsets[4], object.nombre);
  writer.writeLong(offsets[5], object.riesgo);
  writer.writeLong(offsets[6], object.volumen);
}

Silos _silosDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Silos();
  object.altura = reader.readLong(offsets[0]);
  object.idSensor = reader.readString(offsets[1]);
  object.idSilo = reader.readString(offsets[2]);
  object.id_ = id;
  object.mediciones = reader.readObjectList<Mediciones>(
        offsets[3],
        MedicionesSchema.deserialize,
        allOffsets,
        Mediciones(),
      ) ??
      [];
  object.nombre = reader.readString(offsets[4]);
  object.riesgo = reader.readLong(offsets[5]);
  object.volumen = reader.readLong(offsets[6]);
  return object;
}

P _silosDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectList<Mediciones>(
            offset,
            MedicionesSchema.deserialize,
            allOffsets,
            Mediciones(),
          ) ??
          []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _silosGetId(Silos object) {
  return object.id_;
}

List<IsarLinkBase<dynamic>> _silosGetLinks(Silos object) {
  return [];
}

void _silosAttach(IsarCollection<dynamic> col, Id id, Silos object) {
  object.id_ = id;
}

extension SilosQueryWhereSort on QueryBuilder<Silos, Silos, QWhere> {
  QueryBuilder<Silos, Silos, QAfterWhere> anyId_() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SilosQueryWhere on QueryBuilder<Silos, Silos, QWhereClause> {
  QueryBuilder<Silos, Silos, QAfterWhereClause> id_EqualTo(Id id_) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_,
        upper: id_,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> id_NotEqualTo(Id id_) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> id_GreaterThan(Id id_,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_, includeLower: include),
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> id_LessThan(Id id_,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_, includeUpper: include),
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> id_Between(
    Id lowerId_,
    Id upperId_, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_,
        includeLower: includeLower,
        upper: upperId_,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SilosQueryFilter on QueryBuilder<Silos, Silos, QFilterCondition> {
  QueryBuilder<Silos, Silos, QAfterFilterCondition> alturaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altura',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> alturaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'altura',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> alturaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'altura',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> alturaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'altura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idSensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idSensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idSensor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idSensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idSensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idSensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idSensor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSensor',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSensorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idSensor',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idSilo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idSilo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSilo',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idSiloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idSilo',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> id_EqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> id_GreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> id_LessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> id_Between(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediciones',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediciones',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediciones',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediciones',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediciones',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mediciones',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riesgoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riesgo',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riesgoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riesgo',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riesgoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riesgo',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riesgoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riesgo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> volumenEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volumen',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> volumenGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volumen',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> volumenLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volumen',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> volumenBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volumen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SilosQueryObject on QueryBuilder<Silos, Silos, QFilterCondition> {
  QueryBuilder<Silos, Silos, QAfterFilterCondition> medicionesElement(
      FilterQuery<Mediciones> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mediciones');
    });
  }
}

extension SilosQueryLinks on QueryBuilder<Silos, Silos, QFilterCondition> {}

extension SilosQuerySortBy on QueryBuilder<Silos, Silos, QSortBy> {
  QueryBuilder<Silos, Silos, QAfterSortBy> sortByAltura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altura', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByAlturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altura', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByIdSensor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSensor', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByIdSensorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSensor', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByIdSilo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByIdSiloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByRiesgo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgo', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByRiesgoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgo', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByVolumen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volumen', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByVolumenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volumen', Sort.desc);
    });
  }
}

extension SilosQuerySortThenBy on QueryBuilder<Silos, Silos, QSortThenBy> {
  QueryBuilder<Silos, Silos, QAfterSortBy> thenByAltura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altura', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByAlturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altura', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByIdSensor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSensor', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByIdSensorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSensor', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByIdSilo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByIdSiloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenById_() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenById_Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByRiesgo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgo', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByRiesgoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgo', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByVolumen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volumen', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByVolumenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volumen', Sort.desc);
    });
  }
}

extension SilosQueryWhereDistinct on QueryBuilder<Silos, Silos, QDistinct> {
  QueryBuilder<Silos, Silos, QDistinct> distinctByAltura() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altura');
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByIdSensor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idSensor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByIdSilo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idSilo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByRiesgo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'riesgo');
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByVolumen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volumen');
    });
  }
}

extension SilosQueryProperty on QueryBuilder<Silos, Silos, QQueryProperty> {
  QueryBuilder<Silos, int, QQueryOperations> id_Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_');
    });
  }

  QueryBuilder<Silos, int, QQueryOperations> alturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altura');
    });
  }

  QueryBuilder<Silos, String, QQueryOperations> idSensorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idSensor');
    });
  }

  QueryBuilder<Silos, String, QQueryOperations> idSiloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idSilo');
    });
  }

  QueryBuilder<Silos, List<Mediciones>, QQueryOperations> medicionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediciones');
    });
  }

  QueryBuilder<Silos, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Silos, int, QQueryOperations> riesgoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'riesgo');
    });
  }

  QueryBuilder<Silos, int, QQueryOperations> volumenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volumen');
    });
  }
}
