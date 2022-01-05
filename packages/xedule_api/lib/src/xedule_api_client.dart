import 'dart:convert';

import 'package:xedule_api/xedule_api.dart';
import 'package:http/http.dart' as http;

// Exception thrown when getAppointments fails.
class AppointmentsRequestFailure implements Exception {}

// Exception thrown when getGroups fails.
class GroupsRequestFailure implements Exception {}

// Exception thrown when getPeriods fails.
class PeriodsRequestFailure implements Exception {}

// Exception thrown when getFacilities fails.
class ClassroomsRequestFailure implements Exception {}

// Exception thrown when getTeachers fails.
class TeachersRequestFailure implements Exception {}

// Exception thrown when getOrganisationalUnits fails.
class OrganisationalUnitsFailure implements Exception {}

class XeduleApiClient {
  XeduleApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'sa-han.xedule.nl';
  http.Client _httpClient;

  setHttpClient(http.Client httpClient) {
    _httpClient = httpClient;
  }

  Future<List<Appointment>> getAppointments(List<String> ids) async {
    // Construct list of get parameters to request appointments
    Map<String, String> queryParameters = {};
    for (int i = 0; i < ids.length; i++) {
      String id = ids[i];
      queryParameters['ids[$i]'] = id;
    }

    final appointmentsRequest =
        Uri.https(_baseUrl, '/schedule', queryParameters);
    final appointmentsResponse = await _httpClient.get(appointmentsRequest);

    if (appointmentsResponse.statusCode != 200) {
      throw AppointmentsRequestFailure();
    }

    final bodyJson = jsonDecode(appointmentsResponse.body) as List;

    List<Appointment> appointments = [];
    for (var appointmentJson in bodyJson) {
      appointments
          .add(Appointment.fromJson(appointmentJson as Map<String, dynamic>));
    }

    return appointments;
  }

  Future<List<Classroom>> getClassrooms() async {
    final classroomsRequest = Uri.https(_baseUrl, '/classroom');
    final classroomsResponse = await _httpClient.get(classroomsRequest);

    if (classroomsResponse.statusCode != 200) {
      throw ClassroomsRequestFailure();
    }

    final bodyJson = jsonDecode(classroomsResponse.body) as List;
    if (bodyJson.isEmpty) {
      throw ClassroomsRequestFailure();
    }

    List<Classroom> classrooms = [];
    for (var facilityJson in bodyJson) {
      classrooms.add(Classroom.fromJson(facilityJson as Map<String, dynamic>));
    }

    return classrooms;
  }

  Future<List<Group>> getGroups() async {
    final groupsRequest = Uri.https(_baseUrl, '/group');
    final groupsResponse = await _httpClient.get(groupsRequest);

    if (groupsResponse.statusCode != 200) {
      throw GroupsRequestFailure();
    }

    final bodyJson = jsonDecode(groupsResponse.body) as List;
    if (bodyJson.isEmpty) {
      throw GroupsRequestFailure();
    }

    List<Group> groups = [];
    for (var groupJson in bodyJson) {
      groups.add(Group.fromJson(groupJson as Map<String, dynamic>));
    }

    return groups;
  }

  Future<List<OrganisationalUnit>> getOrganisationalUnits() async {
    final organisationalUnitsRequest =
        Uri.https(_baseUrl, '/organisationalUnit');
    final organisationalUnitsResponse =
        await _httpClient.get(organisationalUnitsRequest);

    if (organisationalUnitsResponse.statusCode != 200) {
      throw OrganisationalUnitsFailure();
    }

    final bodyJson = jsonDecode(organisationalUnitsResponse.body) as List;
    if (bodyJson.isEmpty) {
      throw OrganisationalUnitsFailure();
    }

    List<OrganisationalUnit> organisationalUnits = [];
    for (var organisationalUnitJson in bodyJson) {
      organisationalUnits.add(OrganisationalUnit.fromJson(
          organisationalUnitJson as Map<String, dynamic>));
    }

    return organisationalUnits;
  }

  Future<List<Teacher>> getTeachers() async {
    final teachersRequest = Uri.https(_baseUrl, '/docent');
    final teachersResponse = await _httpClient.get(teachersRequest);

    if (teachersResponse.statusCode != 200) {
      throw TeachersRequestFailure();
    }

    final bodyJson = jsonDecode(teachersResponse.body) as List;
    if (bodyJson.isEmpty) {
      throw TeachersRequestFailure();
    }

    List<Teacher> teachers = [];
    for (var teacherJson in bodyJson) {
      teachers.add(Teacher.fromJson(teacherJson as Map<String, dynamic>));
    }

    return teachers;
  }
}
