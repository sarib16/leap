import 'package:flutter/material.dart';
import 'package:leap/colors/color.dart';
import 'package:leap/models/user_model.dart';
import 'package:leap/services/database_service.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _bio = '';

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //updateing user in database
      String _profileImageUrl = '';
      User user = User(
        id: widget.user.id,
        name: _name,
        profileImageUrl: _profileImageUrl,
        bio: _bio,
      );
      //database update
      DatabaseService.updateUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.appBar,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://scontent.fisb9-1.fna.fbcdn.net/v/t1.0-9/12294711_927144887334166_213566168181050030_n.jpg?_nc_cat=101&ccb=2&_nc_sid=174925&_nc_ohc=_FMvKxMze3gAX-7iAoS&_nc_ht=scontent.fisb9-1.fna&oh=4a16dac96d860530965f22bdbdf01dbb&oe=603BE4D1'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () => print('s'),
                    color: color.appBar,
                    minWidth: 60,
                    child: Text(
                      'Edit Profile Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: _name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.person_sharp,
                        color: Colors.white,
                      ),
                    ),
                    validator: (input) => input.trim().length < 1
                        ? 'Please enter a valid name'
                        : null,
                    onSaved: (input) => _name = input,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    textInputAction: TextInputAction.newline,
                    maxLength: 150,
                    initialValue: _bio,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      labelText: "Bio",
                      labelStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.book_sharp,
                        color: Colors.white,
                      ),
                    ),
                    validator: (input) => input.trim().length > 150
                        ? 'Please enter less than 150 characters'
                        : null,
                    onSaved: (input) => _bio = input,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: FlatButton(
                      minWidth: double.infinity,
                      onPressed: _submit,
                      color: color.appBar,
                      textColor: Colors.white,
                      child: Text(
                        'Save Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
