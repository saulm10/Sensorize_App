// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'centros.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCentrosCollection on Isar {
  IsarCollection<Centros> get centros => this.collection();
}

const CentrosSchema = CollectionSchema(
  name: r'Centros',
  id: 396561718286334765,
  properties: {
    r'idCentro': PropertySchema(
      id: 0,
      name: r'idCentro',
      type: IsarType.string,
    ),
    r'nombreCentro': PropertySchema(
      id: 1,
      name: r'nombreCentro',
      type: IsarType.string,
    )
  },
  estimateSize: _centrosEstimateSize,
  serialize: _centrosSerialize,
  deserialize: _centrosDeserialize,
  deserializeProp: _centrosDeserializeProp,
  idName: r'id_',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _centrosGetId,
  getLinks: _centrosGetLinks,
  attach: _centrosAttach,
  version: '3.1.0+1',
);

int _centrosEstimateSize(
  Centros object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idCentro.length * 3;
  bytesCount += 3 + object.nombreCentro.length * 3;
  return bytesCount;
}

void _centrosSerialize(
  Centros object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.idCentro);
  writer.writeString(offsets[1], object.nombreCentro);
}

Centros _centrosDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Centros();
  object.idCentro = reader.readString(offsets[0]);
  object.id_ = id;
  object.nombreCentro = reader.readString(offsets[1]);
  return object;
}

P _centrosDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _centrosGetId(Centros object) {
  return object.id_;
}

List<IsarLinkBase<dynamic>> _centrosGetLinks(Centros object) {
  return [];
}

void _centrosAttach(IsarCollection<dynamic> col, Id id, Centros object) {
  object.id_ = id;
}

extension CentrosQueryWhereSort on QueryBuilder<Centros, Centros, QWhere> {
  QueryBuilder<Centros, Centros, QAfterWhere> anyId_() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CentrosQueryWhere on QueryBuilder<Centros, Centros, QWhereClause> {
  QueryBuilder<Centros, Centros, QAfterWhereClause> id_EqualTo(Id id_) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_,
        upper: id_,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterWhereClause> id_NotEqualTo(Id id_) {
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

  QueryBuilder<Centros, Centros, QAfterWhereClause> id_GreaterThan(Id id_,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_, includeLower: include),
      );
    });
  }

  QueryBuilder<Centros, Centros, QAfterWhereClause> id_LessThan(Id id_,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_, includeUpper: include),
      );
    });
  }

  QueryBuilder<Centros, Centros, QAfterWhereClause> id_Between(
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

extension CentrosQueryFilter
    on QueryBuilder<Centros, Centros, QFilterCondition> {
  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCentro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idCentro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCentro',
        value: '',
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> idCentroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idCentro',
        value: '',
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> id_EqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_',
        value: value,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> id_GreaterThan(
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

  QueryBuilder<Centros, Centros, QAfterFilterCondition> id_LessThan(
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

  QueryBuilder<Centros, Centros, QAfterFilterCondition> id_Between(
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

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreCentro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreCentro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreCentro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition> nombreCentroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCentro',
        value: '',
      ));
    });
  }

  QueryBuilder<Centros, Centros, QAfterFilterCondition>
      nombreCentroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreCentro',
        value: '',
      ));
    });
  }
}

extension CentrosQueryObject
    on QueryBuilder<Centros, Centros, QFilterCondition> {}

extension CentrosQueryLinks
    on QueryBuilder<Centros, Centros, QFilterCondition> {}

extension CentrosQuerySortBy on QueryBuilder<Centros, Centros, QSortBy> {
  QueryBuilder<Centros, Centros, QAfterSortBy> sortByIdCentro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCentro', Sort.asc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> sortByIdCentroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCentro', Sort.desc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> sortByNombreCentro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCentro', Sort.asc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> sortByNombreCentroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCentro', Sort.desc);
    });
  }
}

extension CentrosQuerySortThenBy
    on QueryBuilder<Centros, Centros, QSortThenBy> {
  QueryBuilder<Centros, Centros, QAfterSortBy> thenByIdCentro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCentro', Sort.asc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> thenByIdCentroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCentro', Sort.desc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> thenById_() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_', Sort.asc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> thenById_Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_', Sort.desc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> thenByNombreCentro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCentro', Sort.asc);
    });
  }

  QueryBuilder<Centros, Centros, QAfterSortBy> thenByNombreCentroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCentro', Sort.desc);
    });
  }
}

extension CentrosQueryWhereDistinct
    on QueryBuilder<Centros, Centros, QDistinct> {
  QueryBuilder<Centros, Centros, QDistinct> distinctByIdCentro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCentro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Centros, Centros, QDistinct> distinctByNombreCentro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreCentro', caseSensitive: caseSensitive);
    });
  }
}

extension CentrosQueryProperty
    on QueryBuilder<Centros, Centros, QQueryProperty> {
  QueryBuilder<Centros, int, QQueryOperations> id_Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_');
    });
  }

  QueryBuilder<Centros, String, QQueryOperations> idCentroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCentro');
    });
  }

  QueryBuilder<Centros, String, QQueryOperations> nombreCentroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreCentro');
    });
  }
}
