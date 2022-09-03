import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'package:gestion_diabete/pages/pageMenuMedecin.dart';
import 'package:gestion_diabete/pages/pageMenuPatient.dart';

class AccueilMonTraitement extends StatefulWidget {
  @override
  _AccueilMonTraitement createState() => _AccueilMonTraitement();
}

class _AccueilMonTraitement extends State<AccueilMonTraitement>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Mon traitement'),
        backgroundColor: Color(0xFF216DAD),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: Text(
                  'Traitemets',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ),
            Tab(
              icon: Text(
                'Ordonance',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Text('Mes Medicaments'),
         Text('Mes Ordonances'),
        ],
      ),
    );
  }
}
