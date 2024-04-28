import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Detail.dart';
import 'candidate.dart';
import 'candidate_form_page.dart';
import 'candidate_info_page.dart';

class CandidatesPage extends StatefulWidget {
  @override
  _CandidatesPageState createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  List<Candidate> candidates = [];

  void _showFormDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CandidateFormPage(
          onSubmit: (candidate) {
            setState(() {
              candidates.add(candidate);
            });
          },
        );
      },
    );
  }

  void _showCandidateDetails(Candidate candidate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CandidateInfoPage(candidate: candidate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Election'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (BuildContext context, int index) {
          final candidate = candidates[index];
          return GestureDetector(
            onTap: () {
              _showCandidateDetails(candidate);
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    candidate.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('${candidate.name} ${candidate.firstName}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(candidate.description),
                    SizedBox(height: 4),
                    Text('Parti politique : ${candidate.party}'),
                    SizedBox(height: 4),
                    Text('Date de naissance : ${DateFormat.yMMMMd().format(candidate.selectedDate)}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showFormDialog,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personne',
          ),
        ],
      ),
    );
  }
}
