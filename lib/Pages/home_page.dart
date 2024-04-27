import 'package:flutter/material.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>candidate_info_page(candidate: candidate),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(candidate.imageUrl),
              ),
              title: Text('${candidate.name} ${candidate.firstName}'),
              subtitle: Text(candidate.description),
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
          )
        ],
      ),
    );
  }

  candidate_info_page({required Candidate candidate}) {}
}
