import 'package:coronavirus/app/services/api.dart';
import 'package:flutter/material.dart';


class EndpointsData {
  EndpointsData({@required this.values});
  final Map<Endpoint, int>? values;
   get cases => values![Endpoint.cases];
   get casesSuspected => values![Endpoint.casesSuspected];
   get casesConfirmed => values![Endpoint.casesConfirmed];
   get deaths => values![Endpoint.deaths];
   get recovered => values![Endpoint.recovered];

  @override
  String toString() =>
      'cases: $cases, suspected: $casesSuspected, confirmed: $casesConfirmed, deaths: $deaths, recovered: $recovered';
}
