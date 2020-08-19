import 'package:flutter/material.dart';
import 'dart:async';
import 'crud.dart';
import 'class_penangkap.dart';
import 'enter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CRUD dbHelper = CRUD();
  Future<List<ClassPenangkap>> future;
  AlertDialog alert;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    setState(() {
      future = dbHelper.getContactList();
    });
  }

  showAlertDialog(BuildContext context) {
    ClassPenangkap contact;
    //button OK
    Widget yesButton = FlatButton(
      onPressed: () async {
        int result = await dbHelper.delete(contact);
        if (result > 0) {
          updateListView();
        } 

      },
      child: Text("Alrighty"),
    );

    Widget cancelButton = FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Nope"),
    );

    //persiapan alert dialog
    alert = AlertDialog(
      title: Text("Delete Confirmation"),
      content: Text("Are you sure you want to destroy this item?"),
      actions: [
        yesButton,
        cancelButton,
      ],
    );

    //menampilkan dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
      return alert;
    });
  }

  Future<ClassPenangkap> navigateToEntryForm(
      BuildContext context, ClassPenangkap contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(contact);
    }));
    return result;
  }

  Card cardo(ClassPenangkap contact) {
    // if (contact.status == )
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[300],
          child: Icon(Icons.chrome_reader_mode),
        ),
        title: Text(
          contact.date,
        ),
        subtitle: Text(
            contact.detail.toString() + " || " + contact.location.toString()),
        trailing: GestureDetector(
          child: Icon(Icons.delete),
          onTap: () {
            //show alert dialog
            showAlertDialog(context);
            // int result = await dbHelper.delete(contact);
            // if (result > 0) {
            //   updateListView();
            // }
          },
        ),
        onTap: () async {
          var contact2 = await navigateToEntryForm(context, contact);
          if (contact2 != null) {
            int result = await dbHelper.update(contact2);
            if (result > 0) {
              updateListView();
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Metal Problem'),
      ),
      body: FutureBuilder<List<ClassPenangkap>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                children: snapshot.data.map((todo) => cardo(todo)).toList());
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Tambah Data',
          onPressed: () async {
            var contact = await navigateToEntryForm(context, null);
            if (contact != null) {
              int result = await dbHelper.insert(contact);
              if (result > 0) {
                updateListView();
              }
            }
          }),
    );
  }
}
