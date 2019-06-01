import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget _showEmailInput() {
    return new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 16.0),
        child: new MaterialButton(
          elevation: 5.0,
          minWidth: 200.0,
          height: 42.0,
          color: Colors.blue,
          child: new Text('Login',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget _showForm() {
    return new Form(
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          _showEmailInput(),
          _showPasswordInput(),
          _showPrimaryButton(),
        ],
      ),
    );
  }

  Widget _showBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: new Container(padding: EdgeInsets.all(32.0), child: _showForm()),
      ),
    );
  }

  _validateAndSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _showBody());
  }
}
