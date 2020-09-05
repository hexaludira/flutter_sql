import 'package:flutter/material.dart';
import 'class_penangkap.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class EntryForm extends StatefulWidget {
  final ClassPenangkap contact;

  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(this.contact);
}

class EntryFormState extends State<EntryForm> {
  var _valPerbaikan;
  var _listStatus = ["Already fixed","In Progress"];

  ClassPenangkap contact;

  EntryFormState(this.contact);

  TextEditingController dateController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  //TextEditingController statusController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (contact != null) {
      dateController.text = contact.date;
      detailController.text = contact.detail;
      locationController.text = contact.location;
      //statusController.text = contact.status;
      remarkController.text = contact.remark;

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
            //Date Text
            Padding (
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: DateTimeField(
                format: DateFormat('dd-MMM-yyyy'), 
                onShowPicker: (context, currentValue){
                  return showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2019), 
                    lastDate: DateTime(2025)
                  );
                },
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            //   padding: EdgeInsets.only(top:20.0, bottom:20.0),
            //   child: TextField(
            //     controller: dateController,
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //       labelText: 'Date',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //     ),
            //   ),
             ),

            //Detail text
            Padding (
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: detailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Detail problem',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            //Location text
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: locationController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            //formField DropDown
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      hintText: 'Repair Status',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                    isEmpty: _valPerbaikan == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('Repair Status'),
                        value: _valPerbaikan,
                        isDense: true,
                      
                        onChanged: (String newValue) {
                          setState(() {
                            _valPerbaikan = newValue;
                            state.didChange(newValue);
                          
                          });
                        },
                        items: _listStatus.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            //Status Dropdown
            // Padding(
            //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            //   child: DropdownButton(
            //     hint: Text("Repair status"),
            //     value: _valPerbaikan,
            //     items: _listStatus.map((value){
            //       return DropdownMenuItem(
            //         child: Text(value),
            //         value: value,
            //       );
            //     }).toList(),
            //     onChanged: (value) {
            //       setState(() {
            //         _valPerbaikan = value;
            //       });
            //     }
            //   ),
            // ),
            //Status text
            // Padding(
            //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            //   child: TextField(
            //     controller:statusController,
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //       labelText: 'Status',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //     ),
            //   ),
            // ),
            //Remark Text
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: remarkController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Remark',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            //Save Button
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        if (contact == null) {
                          contact = ClassPenangkap(dateController.text, detailController.text, locationController.text, _valPerbaikan, remarkController.text);
                        } else {
                          contact.date = dateController.text;
                          contact.detail = detailController.text;
                          contact.location = locationController.text;
                          contact.status = _valPerbaikan;
                          contact.remark = remarkController.text;
                        }
                        Navigator.pop(context, contact);
                      },
                    ),
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

// class BasicDateField extends StatelessWidget {
//   final format = DateFormat("dd-MMM-yyyy");
//   @override
//   Widget build(BuildContext context) {
//     return Column (children: <Widget>[
//       Text('Basic date field (${format.pattern})'),
//       DateTimeField(
//         format: format, 
//         onShowPicker: (context, currentValue){
//           return showDatePicker(
//             context: context, 
//             initialDate: null, 
//             firstDate: DateTime(2019), 
//             lastDate: DateTime(2030));
//         },
//         ),
//     ]);
//   }
// }

// class DateTimeForm extends StatefulWidget {
//   @override
//   _DateTimeFormState createState() => _DateTimeFormState();
// }

// class _DateTimeFormState extends State<DateTimeForm> {
//   final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           BasicDateField(),
//           SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }