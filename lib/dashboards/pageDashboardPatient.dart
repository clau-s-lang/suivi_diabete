import 'package:flutter/material.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../users/pageLogin.dart';

class DashboardPatient extends StatefulWidget {
  @override
  _DashboardPatientState createState() => _DashboardPatientState();
}

class _DashboardPatientState extends State<DashboardPatient> {
  @override
  Widget build(BuildContext context) {
    return DonneesPatient();
    ;
  }
}
