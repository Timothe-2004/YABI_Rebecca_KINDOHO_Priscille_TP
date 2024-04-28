
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'candidate.dart'; //
import 'candidate_info_page.dart';
import 'Detail.dart';
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
  String _imageUrl = '';
  DateTime _selectedDate = DateTime.now();
  String _party = '';
  final _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat.yMMMMd().format(_selectedDate);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(Candidate(
        name: _name,
        firstName: _firstName,
        description: _description,
        imageUrl: _imageUrl,
        selectedDate: _selectedDate,
        party: _party,
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Creation de candidat'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: ('Nom'),
                  hintText: 'entrez votre nom',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  hintText: 'entrez votre prénom',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  prefixIcon: Icon(Icons.warning),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey.shade100,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 10),
              TextFormField( // Nouveau champ pour le parti politique
                decoration: InputDecoration(
                  labelText: 'Parti politique',
                  hintText: 'entrez le parti politique',
                  prefixIcon: Icon(Icons.flag),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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

              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date de naissance',
                  hintText: 'Cliquez pour sélectionner une date',
                ),
                readOnly: true,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                      _dateController.text = DateFormat.yMMMMd().format(_selectedDate);
                    });
                  }
                },
              ),


            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _submitForm, // Changement de l'appel de la méthode pour inclure la sauvegarde du formulaire
          child: const Text('Sauvegarder'),
        ),
      ],
    );
  }
}
