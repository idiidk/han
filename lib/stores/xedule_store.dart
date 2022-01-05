import 'package:han/utils/date_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:xedule_api/xedule_api.dart' show XeduleApiClient;
import 'package:xedule_repository/xedule_repository.dart';

part 'xedule_store.g.dart';

class XeduleStore = _XeduleStore with _$XeduleStore;

class NoOrganisationalUnitsException implements Exception {}

class OrganisationalUnitNotFoundException implements Exception {}

abstract class _XeduleStore with Store {
  final XeduleRepository repository = XeduleRepository();

  // Empty values
  static ObservableFuture<List<Appointment>> emptyAppointmentsResponse =
      ObservableFuture.value([]);

  static ObservableFuture<List<Classroom>> emptyClassroomsResponse =
      ObservableFuture.value([]);

  static ObservableFuture<List<Group>> emptyGroupsResponse =
      ObservableFuture.value([]);

  static ObservableFuture<List<OrganisationalUnit>>
      emptyOrganisationalUnitsResponse = ObservableFuture.value([]);

  static ObservableFuture<List<Teacher>> emptyTeachersResponse =
      ObservableFuture.value([]);

  // Observables
  @observable
  ObservableFuture<List<Appointment>> fetchAppointmentsFuture =
      emptyAppointmentsResponse;

  @observable
  ObservableFuture<List<Classroom>> fetchClassroomsFuture =
      emptyClassroomsResponse;

  @observable
  ObservableFuture<List<Group>> fetchGroupsFuture = emptyGroupsResponse;

  @observable
  ObservableFuture<List<OrganisationalUnit>> fetchOrganisationalUnitsFuture =
      emptyOrganisationalUnitsResponse;

  @observable
  ObservableFuture<List<Teacher>> fetchTeachersFuture = emptyTeachersResponse;

  // Computed
  @computed
  bool get hasAppointments =>
      fetchAppointmentsFuture != emptyAppointmentsResponse &&
      fetchAppointmentsFuture.status == FutureStatus.fulfilled;

  @computed
  bool get hasClassrooms =>
      fetchClassroomsFuture != emptyClassroomsResponse &&
      fetchClassroomsFuture.status == FutureStatus.fulfilled;

  @computed
  bool get hasGroups =>
      fetchGroupsFuture != emptyGroupsResponse &&
      fetchGroupsFuture.status == FutureStatus.fulfilled;

  @computed
  bool get hasOrganisationalUnits =>
      fetchOrganisationalUnitsFuture != emptyOrganisationalUnitsResponse &&
      fetchOrganisationalUnitsFuture.status == FutureStatus.fulfilled;

  @computed
  bool get hasTeachers =>
      fetchTeachersFuture != emptyTeachersResponse &&
      fetchTeachersFuture.status == FutureStatus.fulfilled;

  // Actions
  @action
  void setApiClient(XeduleApiClient client) {
    repository.setApiClient(client);
  }

  @action
  Future<List<Classroom>> fetchClassrooms() async {
    final future = repository.getClassrooms();
    fetchClassroomsFuture = ObservableFuture(future);

    return await future;
  }

  @action
  Future<List<Group>> fetchGroups() async {
    final future = repository.getGroups();
    fetchGroupsFuture = ObservableFuture(future);

    return await future;
  }

  @action
  Future<List<OrganisationalUnit>> fetchOrganisationalUnits() async {
    final future = repository.getOrganisationalUnits();
    fetchOrganisationalUnitsFuture = ObservableFuture(future);

    return await future;
  }

  @action
  Future<List<Teacher>> fetchTeachers() async {
    final future = repository.getTeachers();
    fetchTeachersFuture = ObservableFuture(future);

    return await future;
  }

  @action
  Future<List<Appointment>> fetchAppointments(
    DateTime date,
    List<Group> groups,
  ) async {
    if (!hasOrganisationalUnits) {
      throw NoOrganisationalUnitsException();
    }

    final weekNumber = DateUtils.weekNumber(date);
    final List<String> ids = [];

    // Construct a list of schedule id's to request
    for (final group in groups) {
      for (final organisationalUnitId in group.organisationalUnitIds) {
        final organisationalUnit = fetchOrganisationalUnitsFuture.value
            ?.firstWhere((ou) => ou.id == organisationalUnitId.toString());

        if (organisationalUnit == null) {
          throw OrganisationalUnitNotFoundException();
        }

        for (final yearCode in organisationalUnit.yearCodes) {
          ids.add('${yearCode}_${weekNumber}_${group.id}');
        }
      }
    }

    final future = repository.getAppointments(ids);
    fetchAppointmentsFuture = ObservableFuture(future);

    return await future;
  }
}
