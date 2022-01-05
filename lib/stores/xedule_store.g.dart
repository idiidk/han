// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$XeduleStore on _XeduleStore, Store {
  Computed<bool>? _$hasAppointmentsComputed;

  @override
  bool get hasAppointments =>
      (_$hasAppointmentsComputed ??= Computed<bool>(() => super.hasAppointments,
              name: '_XeduleStore.hasAppointments'))
          .value;
  Computed<bool>? _$hasClassroomsComputed;

  @override
  bool get hasClassrooms =>
      (_$hasClassroomsComputed ??= Computed<bool>(() => super.hasClassrooms,
              name: '_XeduleStore.hasClassrooms'))
          .value;
  Computed<bool>? _$hasGroupsComputed;

  @override
  bool get hasGroups => (_$hasGroupsComputed ??=
          Computed<bool>(() => super.hasGroups, name: '_XeduleStore.hasGroups'))
      .value;
  Computed<bool>? _$hasOrganisationalUnitsComputed;

  @override
  bool get hasOrganisationalUnits => (_$hasOrganisationalUnitsComputed ??=
          Computed<bool>(() => super.hasOrganisationalUnits,
              name: '_XeduleStore.hasOrganisationalUnits'))
      .value;
  Computed<bool>? _$hasTeachersComputed;

  @override
  bool get hasTeachers =>
      (_$hasTeachersComputed ??= Computed<bool>(() => super.hasTeachers,
              name: '_XeduleStore.hasTeachers'))
          .value;

  final _$fetchAppointmentsFutureAtom =
      Atom(name: '_XeduleStore.fetchAppointmentsFuture');

  @override
  ObservableFuture<List<Appointment>> get fetchAppointmentsFuture {
    _$fetchAppointmentsFutureAtom.reportRead();
    return super.fetchAppointmentsFuture;
  }

  @override
  set fetchAppointmentsFuture(ObservableFuture<List<Appointment>> value) {
    _$fetchAppointmentsFutureAtom
        .reportWrite(value, super.fetchAppointmentsFuture, () {
      super.fetchAppointmentsFuture = value;
    });
  }

  final _$fetchClassroomsFutureAtom =
      Atom(name: '_XeduleStore.fetchClassroomsFuture');

  @override
  ObservableFuture<List<Classroom>> get fetchClassroomsFuture {
    _$fetchClassroomsFutureAtom.reportRead();
    return super.fetchClassroomsFuture;
  }

  @override
  set fetchClassroomsFuture(ObservableFuture<List<Classroom>> value) {
    _$fetchClassroomsFutureAtom.reportWrite(value, super.fetchClassroomsFuture,
        () {
      super.fetchClassroomsFuture = value;
    });
  }

  final _$fetchGroupsFutureAtom = Atom(name: '_XeduleStore.fetchGroupsFuture');

  @override
  ObservableFuture<List<Group>> get fetchGroupsFuture {
    _$fetchGroupsFutureAtom.reportRead();
    return super.fetchGroupsFuture;
  }

  @override
  set fetchGroupsFuture(ObservableFuture<List<Group>> value) {
    _$fetchGroupsFutureAtom.reportWrite(value, super.fetchGroupsFuture, () {
      super.fetchGroupsFuture = value;
    });
  }

  final _$fetchOrganisationalUnitsFutureAtom =
      Atom(name: '_XeduleStore.fetchOrganisationalUnitsFuture');

  @override
  ObservableFuture<List<OrganisationalUnit>>
      get fetchOrganisationalUnitsFuture {
    _$fetchOrganisationalUnitsFutureAtom.reportRead();
    return super.fetchOrganisationalUnitsFuture;
  }

  @override
  set fetchOrganisationalUnitsFuture(
      ObservableFuture<List<OrganisationalUnit>> value) {
    _$fetchOrganisationalUnitsFutureAtom
        .reportWrite(value, super.fetchOrganisationalUnitsFuture, () {
      super.fetchOrganisationalUnitsFuture = value;
    });
  }

  final _$fetchTeachersFutureAtom =
      Atom(name: '_XeduleStore.fetchTeachersFuture');

  @override
  ObservableFuture<List<Teacher>> get fetchTeachersFuture {
    _$fetchTeachersFutureAtom.reportRead();
    return super.fetchTeachersFuture;
  }

  @override
  set fetchTeachersFuture(ObservableFuture<List<Teacher>> value) {
    _$fetchTeachersFutureAtom.reportWrite(value, super.fetchTeachersFuture, () {
      super.fetchTeachersFuture = value;
    });
  }

  final _$fetchClassroomsAsyncAction =
      AsyncAction('_XeduleStore.fetchClassrooms');

  @override
  Future<List<Classroom>> fetchClassrooms() {
    return _$fetchClassroomsAsyncAction.run(() => super.fetchClassrooms());
  }

  final _$fetchGroupsAsyncAction = AsyncAction('_XeduleStore.fetchGroups');

  @override
  Future<List<Group>> fetchGroups() {
    return _$fetchGroupsAsyncAction.run(() => super.fetchGroups());
  }

  final _$fetchOrganisationalUnitsAsyncAction =
      AsyncAction('_XeduleStore.fetchOrganisationalUnits');

  @override
  Future<List<OrganisationalUnit>> fetchOrganisationalUnits() {
    return _$fetchOrganisationalUnitsAsyncAction
        .run(() => super.fetchOrganisationalUnits());
  }

  final _$fetchTeachersAsyncAction = AsyncAction('_XeduleStore.fetchTeachers');

  @override
  Future<List<Teacher>> fetchTeachers() {
    return _$fetchTeachersAsyncAction.run(() => super.fetchTeachers());
  }

  final _$fetchAppointmentsAsyncAction =
      AsyncAction('_XeduleStore.fetchAppointments');

  @override
  Future<List<Appointment>> fetchAppointments(
      DateTime date, List<Group> groups) {
    return _$fetchAppointmentsAsyncAction
        .run(() => super.fetchAppointments(date, groups));
  }

  final _$_XeduleStoreActionController = ActionController(name: '_XeduleStore');

  @override
  void setApiClient(XeduleApiClient client) {
    final _$actionInfo = _$_XeduleStoreActionController.startAction(
        name: '_XeduleStore.setApiClient');
    try {
      return super.setApiClient(client);
    } finally {
      _$_XeduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchAppointmentsFuture: ${fetchAppointmentsFuture},
fetchClassroomsFuture: ${fetchClassroomsFuture},
fetchGroupsFuture: ${fetchGroupsFuture},
fetchOrganisationalUnitsFuture: ${fetchOrganisationalUnitsFuture},
fetchTeachersFuture: ${fetchTeachersFuture},
hasAppointments: ${hasAppointments},
hasClassrooms: ${hasClassrooms},
hasGroups: ${hasGroups},
hasOrganisationalUnits: ${hasOrganisationalUnits},
hasTeachers: ${hasTeachers}
    ''';
  }
}
