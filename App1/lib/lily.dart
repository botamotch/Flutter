import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> queryIRI(String iri) async {
  List<String> body = [];
  var querySPARQL = '''
      PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detai/>
      PREFIX schema: <http://schema.org/>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX foaf: <http://xmlns.com/foaf/0.1/>
      PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>

      SELECT ?member ?name
      WHERE {
        ?member rdf:type lily:${iri}.
        ?member schema:name ?name. FILTER(lang(?name)="ja")
      }
      ''';

  var queryHeader = 'https://lily.fvhp.net/sparql/query';
  var queryBody = {'format': 'json', 'query': querySPARQL};
  var uri = Uri.parse(queryHeader);

  http.Response response = await http.post(uri, body: queryBody);

  if (response.statusCode != 200) {
    // print('# Response Status Error : ${response.statusCode}');
  } else {
    print('# Response Status : ${response.statusCode}');
    // print('# Response Body : ${response.body}');
    Map responseBody = jsonDecode(response.body);
    List responseBodyResults = responseBody['results']['bindings'];
    responseBodyResults.forEach((var l) {
      body.add(l['name']['value']);
      print('> ${l['name']['value']}');
    });
    // print(body);
  }
  return body;
}

Future<List<String>> queryLilyByGarden(String garden, String lang) async {
  List<String> body = [];

  var querySPARQL = '''
      PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detai/>
      PREFIX schema: <http://schema.org/>
      PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
      PREFIX owl: <http://www.w3.org/2002/07/owl#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX foaf: <http://xmlns.com/foaf/0.1/>
      PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>

      SELECT ?lily ?name
      WHERE {
        ?lily lily:garden "${garden}".
        ?lily schema:name ?name. FILTER(lang(?name)="${lang}")
      }
      ''';

  var queryHeader = 'https://lily.fvhp.net/sparql/query';
  var queryBody = {'format': 'json', 'query': querySPARQL};
  var uri = Uri.parse(queryHeader);

  http.Response response = await http.post(uri, body: queryBody);

  if (response.statusCode != 200) {
    // print('# Response Status Error : ${response.statusCode}');
  } else {
    // print('# Response Status : ${response.statusCode}');
    // print('# Response Body : ${response.body}');
    Map responseBody = jsonDecode(response.body);
    List responseBodyResults = responseBody['results']['bindings'];
    responseBodyResults.forEach((var l) {
      body.add(l['name']['value']);
    });
    // print(body);
  }
  return body;
}
