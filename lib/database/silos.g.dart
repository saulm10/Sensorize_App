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
    r'height': PropertySchema(
      id: 0,
      name: r'height',
      type: IsarType.double,
    ),
    r'risk': PropertySchema(
      id: 1,
      name: r'risk',
      type: IsarType.long,
    ),
    r'sensor': PropertySchema(
      id: 2,
      name: r'sensor',
      type: IsarType.object,
      target: r'Sensor',
    ),
    r'siloName': PropertySchema(
      id: 3,
      name: r'siloName',
      type: IsarType.string,
    ),
    r'volumen': PropertySchema(
      id: 4,
      name: r'volumen',
      type: IsarType.long,
    )
  },
  estimateSize: _silosEstimateSize,
  serialize: _silosSerialize,
  deserialize: _silosDeserialize,
  deserializeProp: _silosDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Sensor': SensorSchema},
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
  bytesCount += 3 +
      SensorSchema.estimateSize(object.sensor, allOffsets[Sensor]!, allOffsets);
  bytesCount += 3 + object.siloName.length * 3;
  return bytesCount;
}

void _silosSerialize(
  Silos object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.height);
  writer.writeLong(offsets[1], object.risk);
  writer.writeObject<Sensor>(
    offsets[2],
    allOffsets,
    SensorSchema.serialize,
    object.sensor,
  );
  writer.writeString(offsets[3], object.siloName);
  writer.writeLong(offsets[4], object.volumen);
}

Silos _silosDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Silos();
  object.height = reader.readDouble(offsets[0]);
  object.id = id;
  object.risk = reader.readLong(offsets[1]);
  object.sensor = reader.readObjectOrNull<Sensor>(
        offsets[2],
        SensorSchema.deserialize,
        allOffsets,
      ) ??
      Sensor();
  object.siloName = reader.readString(offsets[3]);
  object.volumen = reader.readLong(offsets[4]);
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Sensor>(
            offset,
            SensorSchema.deserialize,
            allOffsets,
          ) ??
          Sensor()) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _silosGetId(Silos object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _silosGetLinks(Silos object) {
  return [];
}

void _silosAttach(IsarCollection<dynamic> col, Id id, Silos object) {
  object.id = id;
}

extension SilosQueryWhereSort on QueryBuilder<Silos, Silos, QWhere> {
  QueryBuilder<Silos, Silos, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SilosQueryWhere on QueryBuilder<Silos, Silos, QWhereClause> {
  QueryBuilder<Silos, Silos, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Silos, Silos, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SilosQueryFilter on QueryBuilder<Silos, Silos, QFilterCondition> {
  QueryBuilder<Silos, Silos, QAfterFilterCondition> heightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> heightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> heightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> heightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riskEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'risk',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riskGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'risk',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riskLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'risk',
        value: value,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> riskBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'risk',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siloName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siloName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siloName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siloName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siloName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siloName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siloName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siloName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siloName',
        value: '',
      ));
    });
  }

  QueryBuilder<Silos, Silos, QAfterFilterCondition> siloNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siloName',
        value: '',
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
  QueryBuilder<Silos, Silos, QAfterFilterCondition> sensor(
      FilterQuery<Sensor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sensor');
    });
  }
}

extension SilosQueryLinks on QueryBuilder<Silos, Silos, QFilterCondition> {}

extension SilosQuerySortBy on QueryBuilder<Silos, Silos, QSortBy> {
  QueryBuilder<Silos, Silos, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByRisk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'risk', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortByRiskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'risk', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortBySiloName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siloName', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> sortBySiloNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siloName', Sort.desc);
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
  QueryBuilder<Silos, Silos, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByRisk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'risk', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenByRiskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'risk', Sort.desc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenBySiloName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siloName', Sort.asc);
    });
  }

  QueryBuilder<Silos, Silos, QAfterSortBy> thenBySiloNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siloName', Sort.desc);
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
  QueryBuilder<Silos, Silos, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByRisk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'risk');
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctBySiloName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siloName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Silos, Silos, QDistinct> distinctByVolumen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volumen');
    });
  }
}

extension SilosQueryProperty on QueryBuilder<Silos, Silos, QQueryProperty> {
  QueryBuilder<Silos, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Silos, double, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<Silos, int, QQueryOperations> riskProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'risk');
    });
  }

  QueryBuilder<Silos, Sensor, QQueryOperations> sensorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sensor');
    });
  }

  QueryBuilder<Silos, String, QQueryOperations> siloNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siloName');
    });
  }

  QueryBuilder<Silos, int, QQueryOperations> volumenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volumen');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SensorSchema = Schema(
  name: r'Sensor',
  id: -7696782883064080717,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    )
  },
  estimateSize: _sensorEstimateSize,
  serialize: _sensorSerialize,
  deserialize: _sensorDeserialize,
  deserializeProp: _sensorDeserializeProp,
);

int _sensorEstimateSize(
  Sensor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _sensorSerialize(
  Sensor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
}

Sensor _sensorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sensor();
  object.id = reader.readLong(offsets[0]);
  return object;
}

P _sensorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SensorQueryFilter on QueryBuilder<Sensor, Sensor, QFilterCondition> {
  QueryBuilder<Sensor, Sensor, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sensor, Sensor, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sensor, Sensor, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sensor, Sensor, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SensorQueryObject on QueryBuilder<Sensor, Sensor, QFilterCondition> {}
