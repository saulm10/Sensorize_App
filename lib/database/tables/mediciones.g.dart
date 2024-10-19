// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediciones.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicionesCollection on Isar {
  IsarCollection<Mediciones> get mediciones => this.collection();
}

const MedicionesSchema = CollectionSchema(
  name: r'Mediciones',
  id: -2928636043220005330,
  properties: {
    r'fechaRegistro': PropertySchema(
      id: 0,
      name: r'fechaRegistro',
      type: IsarType.dateTime,
    ),
    r'idMedicion': PropertySchema(
      id: 1,
      name: r'idMedicion',
      type: IsarType.string,
    ),
    r'idSilo': PropertySchema(
      id: 2,
      name: r'idSilo',
      type: IsarType.string,
    ),
    r'resultado': PropertySchema(
      id: 3,
      name: r'resultado',
      type: IsarType.long,
    )
  },
  estimateSize: _medicionesEstimateSize,
  serialize: _medicionesSerialize,
  deserialize: _medicionesDeserialize,
  deserializeProp: _medicionesDeserializeProp,
  idName: r'id_',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medicionesGetId,
  getLinks: _medicionesGetLinks,
  attach: _medicionesAttach,
  version: '3.1.0+1',
);

int _medicionesEstimateSize(
  Mediciones object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idMedicion.length * 3;
  bytesCount += 3 + object.idSilo.length * 3;
  return bytesCount;
}

void _medicionesSerialize(
  Mediciones object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fechaRegistro);
  writer.writeString(offsets[1], object.idMedicion);
  writer.writeString(offsets[2], object.idSilo);
  writer.writeLong(offsets[3], object.resultado);
}

Mediciones _medicionesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mediciones();
  object.fechaRegistro = reader.readDateTime(offsets[0]);
  object.idMedicion = reader.readString(offsets[1]);
  object.idSilo = reader.readString(offsets[2]);
  object.id_ = id;
  object.resultado = reader.readLong(offsets[3]);
  return object;
}

P _medicionesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicionesGetId(Mediciones object) {
  return object.id_;
}

List<IsarLinkBase<dynamic>> _medicionesGetLinks(Mediciones object) {
  return [];
}

void _medicionesAttach(IsarCollection<dynamic> col, Id id, Mediciones object) {
  object.id_ = id;
}

extension MedicionesQueryWhereSort
    on QueryBuilder<Mediciones, Mediciones, QWhere> {
  QueryBuilder<Mediciones, Mediciones, QAfterWhere> anyId_() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicionesQueryWhere
    on QueryBuilder<Mediciones, Mediciones, QWhereClause> {
  QueryBuilder<Mediciones, Mediciones, QAfterWhereClause> id_EqualTo(Id id_) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_,
        upper: id_,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterWhereClause> id_NotEqualTo(
      Id id_) {
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

  QueryBuilder<Mediciones, Mediciones, QAfterWhereClause> id_GreaterThan(Id id_,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_, includeLower: include),
      );
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterWhereClause> id_LessThan(Id id_,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterWhereClause> id_Between(
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

extension MedicionesQueryFilter
    on QueryBuilder<Mediciones, Mediciones, QFilterCondition> {
  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaRegistroEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaRegistroGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaRegistroLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaRegistroBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaRegistro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idMedicionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idMedicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idMedicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idMedicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idMedicionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idMedicion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idMedicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idMedicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idMedicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idMedicionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idMedicion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idMedicion',
        value: '',
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idMedicionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idMedicion',
        value: '',
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloEqualTo(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloGreaterThan(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloLessThan(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloBetween(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloStartsWith(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloEndsWith(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idSilo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloMatches(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSiloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSilo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idSiloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idSilo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> id_EqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> id_GreaterThan(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> id_LessThan(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> id_Between(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> resultadoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resultado',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      resultadoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resultado',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> resultadoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resultado',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> resultadoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resultado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MedicionesQueryObject
    on QueryBuilder<Mediciones, Mediciones, QFilterCondition> {}

extension MedicionesQueryLinks
    on QueryBuilder<Mediciones, Mediciones, QFilterCondition> {}

extension MedicionesQuerySortBy
    on QueryBuilder<Mediciones, Mediciones, QSortBy> {
  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByFechaRegistro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByFechaRegistroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByIdMedicion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMedicion', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByIdMedicionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMedicion', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByIdSilo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByIdSiloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByResultado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultado', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> sortByResultadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultado', Sort.desc);
    });
  }
}

extension MedicionesQuerySortThenBy
    on QueryBuilder<Mediciones, Mediciones, QSortThenBy> {
  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByFechaRegistro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByFechaRegistroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByIdMedicion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMedicion', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByIdMedicionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMedicion', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByIdSilo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByIdSiloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idSilo', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenById_() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenById_Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_', Sort.desc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByResultado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultado', Sort.asc);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterSortBy> thenByResultadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultado', Sort.desc);
    });
  }
}

extension MedicionesQueryWhereDistinct
    on QueryBuilder<Mediciones, Mediciones, QDistinct> {
  QueryBuilder<Mediciones, Mediciones, QDistinct> distinctByFechaRegistro() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaRegistro');
    });
  }

  QueryBuilder<Mediciones, Mediciones, QDistinct> distinctByIdMedicion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idMedicion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QDistinct> distinctByIdSilo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idSilo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mediciones, Mediciones, QDistinct> distinctByResultado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resultado');
    });
  }
}

extension MedicionesQueryProperty
    on QueryBuilder<Mediciones, Mediciones, QQueryProperty> {
  QueryBuilder<Mediciones, int, QQueryOperations> id_Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_');
    });
  }

  QueryBuilder<Mediciones, DateTime, QQueryOperations> fechaRegistroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaRegistro');
    });
  }

  QueryBuilder<Mediciones, String, QQueryOperations> idMedicionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idMedicion');
    });
  }

  QueryBuilder<Mediciones, String, QQueryOperations> idSiloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idSilo');
    });
  }

  QueryBuilder<Mediciones, int, QQueryOperations> resultadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resultado');
    });
  }
}
