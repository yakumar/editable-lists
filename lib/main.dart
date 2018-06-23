import 'package:flutter/material.dart';

import 'puppy.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      buttonColor: Colors.cyan,
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          padding: new EdgeInsets.all(5.0),
          ),
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Puppy> puppyList = new List();
  TextEditingController _userNameField = new TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_userNameField.text = "";

    puppyList = [
      Puppy("puppy 1", 2, "Cutest puppy on planet", "assets/puppy1.jpg"),
      Puppy("puppy 2", 2, "AM the Cutest puppy on planet", "assets/puppy2.jpg"),
      Puppy("puppy 3", 2, "No ur not Cutest puppy on planet",
          "assets/puppy3.jpg"),
      Puppy("puppy 4", 2, "Some one must be Cutest puppy on planet",
          "assets/puppy4.jpg"),
      Puppy("puppy 5", 2, "Hope all are Cutest puppy on planet",
          "assets/puppy5.jpg"),
      Puppy("puppy 6", 2, "No one is Cutest puppy on planet",
          "assets/puppy6.png"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('New APP BAR!!'),
          //backgroundColor: Colors.blueAccent,
        ),
        body: new ListView.builder(
          itemExtent: 80.0,
          itemCount: puppyList.length,
          itemBuilder: _itemBuilder,
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return new ListTile(
      onTap: () => showDialog(

            context: context,
            builder: (context) => _simpleDialog(context, puppyList[index]),
          ),
      title: new Text(puppyList[index].name),
      leading: new CircleAvatar(
        backgroundImage: AssetImage(puppyList[index].imageUrl),
      ),
      trailing: new IconButton(icon: Icon(Icons.edit), onPressed: () {}),
    );
  }

  Widget _simpleDialog(BuildContext context, Puppy puppy) {
    return new SimpleDialog(


      //contentPadding: EdgeInsets.all(5.0),
      //contentPadding: new EdgeInsetsGeo,
      //contentPadding: ,
      //title: new Text(puppy.name),
      children: <Widget>[
        new Form(

          child: Column(


            crossAxisAlignment: CrossAxisAlignment.stretch,
            //shrinkWrap: true,

            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  initialValue: puppy.name,
                  decoration: new InputDecoration(labelText: 'edit name'),
                  onSaved: (val) => puppy.name = val,
                ),
              ),
//               new TextFormField(
//                 initialValue: ,
//
//
//               ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  initialValue: puppy.description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  initialValue: (puppy.age).toString(),
                  onSaved: (val) => puppy.age = int.parse(val),
                ),
              ),
              //new Image.file(file),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset(
                  puppy.imageUrl,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: new Wrap(
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: new Text('Cancel'),
                    ),
                    SizedBox(width: 8.0,),
                    new RaisedButton(
                      onPressed: _saveBtn,
                      child: new Text('Save'),
                    ),

                  ],
                ),
              ),

            ],
          ),
          key: formKey,
        )
      ],
    );
  }

  void _saveBtn() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        form.save();
        Navigator.of(context).pop();
      });
    }
  }
}
