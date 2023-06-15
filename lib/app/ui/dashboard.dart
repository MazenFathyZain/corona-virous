import 'package:coronavirus/app/repositories/endpoints_data.dart';
import 'package:coronavirus/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/data_repository.dart';
import 'endpoint_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData? _endpointsData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() => _endpointsData = endpointsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coronavirus Tracker"),
      ),
      body: RefreshIndicator(
        color: Colors.greenAccent,
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData?.values![endpoint]
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
