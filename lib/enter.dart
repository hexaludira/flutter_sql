import 'package:flutter/material.dart';
import 'class_penangkap.dart';

class EntryForm extends StatefulWidget {
  final ClassPenangkap contact;

  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(this.contact);
}

class EntryFormState extends State<EntryForm> {
  ClassPenangkap contact;

  EntryFormState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (contact != null) {
      nameController.text = contact.name;
      phoneController.text = contact.phone;
    }
    return Scaffold(
      appBar: AppBar(
        title: contact == null ? Text('Tambah') : Text('Rubah'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            //nama
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ,
            ),
          ],
        ),
      ),
      
    );
  }
}