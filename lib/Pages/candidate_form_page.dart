
import 'package:flutter/material.dart';
import 'candidate_info_page.dart';

class CandidateFormPage extends StatefulWidget {
  final Function(Candidate) onSubmit;

  CandidateFormPage({required this.onSubmit});

  @override
  _CandidateFormPageState createState() => _CandidateFormPageState();
}

class _CandidateFormPageState extends State<CandidateFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _firstName = '';
  String _description = '';
  String _party = '';
  String _imageUrl = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(Candidate(
        name: _name,
        firstName: _firstName,
        description: _description,
        party: _party,
        imageUrl: _imageUrl,
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Creation du candidat'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: ('Nom'),
                  hintText: 'entrez votre prenom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.person),
                  fillColor: Colors.grey.shade100,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du candidat';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ('Prénom'),
                  hintText: 'entrez votre prenom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.person),
                  fillColor: Colors.grey.shade100,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prénom du candidat';
                  }
                  return null;
                },
                onSaved: (value) => _firstName = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'entrez votre description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  prefixIcon: Icon(Icons.warning),
                  fillColor: Colors.grey.shade100,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),

                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Parti politique',
                  hintText: 'entrez le parti politique',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.flag),
                  fillColor: Colors.grey.shade100,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),

                onSaved: (value) => _party = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'URL de la photo',
                  hintText: 'entrez votre url',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  fillColor: Colors.grey.shade100,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),

                onSaved: (value) => _imageUrl = value!,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text('Sauvegarder'),
        ),
      ],
    );
  }
}


