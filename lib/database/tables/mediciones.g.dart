// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediciones.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MedicionesSchema = Schema(
  name: r'Mediciones',
  id: -2928636043220005330,
  properties: {
    r'fechaResgistro': PropertySchema(
      id: 0,
      name: r'fechaResgistro',
      type: IsarType.dateTime,
    ),
    r'idMedicion': PropertySchema(
      id: 1,
      name: r'idMedicion',
      type: IsarType.string,
    ),
    r'idSensor': PropertySchema(
      id: 2,
      name: r'idSensor',
      type: IsarType.string,
    ),
    r'medicion': PropertySchema(
      id: 3,
      name: r'medicion',
      type: IsarType.long,
    )
  },
  estimateSize: _medicionesEstimateSize,
  serialize: _medicionesSerialize,
  deserialize: _medicionesDeserialize,
  deserializeProp: _medicionesDeserializeProp,
);

int _medicionesEstimateSize(
  Mediciones object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idMedicion.length * 3;
  bytesCount += 3 + object.idSensor.length * 3;
  return bytesCount;
}

void _medicionesSerialize(
  Mediciones object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fechaResgistro);
  writer.writeString(offsets[1], object.idMedicion);
  writer.writeString(offsets[2], object.idSensor);
  writer.writeLong(offsets[3], object.medicion);
}

Mediciones _medicionesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mediciones();
  object.fechaResgistro = reader.readDateTime(offsets[0]);
  object.idMedicion = reader.readString(offsets[1]);
  object.idSensor = reader.readString(offsets[2]);
  object.medicion = reader.readLong(offsets[3]);
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

extension MedicionesQueryFilter
    on QueryBuilder<Mediciones, Mediciones, QFilterCondition> {
  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaResgistroEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaResgistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaResgistroGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaResgistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaResgistroLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaResgistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      fechaResgistroBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaResgistro',
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSensorEqualTo(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idSensorGreaterThan(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSensorLessThan(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSensorBetween(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idSensorStartsWith(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSensorEndsWith(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSensorContains(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> idSensorMatches(
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

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idSensorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idSensor',
        value: '',
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      idSensorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idSensor',
        value: '',
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> medicionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicion',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition>
      medicionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicion',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> medicionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicion',
        value: value,
      ));
    });
  }

  QueryBuilder<Mediciones, Mediciones, QAfterFilterCondition> medicionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicion',
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
