import 'package:hello_promodoro/Backend/Authentication.dart';
import 'package:hello_promodoro/FrontEnd/alertDialogShow.dart';
import 'package:flutter/material.dart';
import 'package:hello_promodoro/FrontEnd/Sign_up.dart';

class AccountManagerLogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountCreate();
  }
}

class AccountCreate extends State<AccountManagerLogIn> {
  TextEditingController _nameIs = TextEditingController();
  TextEditingController _pwdIs = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameIs.dispose();
    _pwdIs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: Icon(Icons.login),
          title: Text(
            "Log-in",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Sign-Up",
          child: Icon(Icons.person_add_alt_1_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountManagerSignUp()));
          },
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20.0),
              inputTake(context, "name"),
              SizedBox(height: 20.0),
              inputTake(context),
              SizedBox(height: 40.0),
              buttons(),
            ],
          ),
        ));
  }

  Widget inputTake(BuildContext context, [String indicator = "other"]) {
    String labelValue = "", hintValue = "";
    bool permission;

    indicator == "name"
        ? labelValue = "User Name"
        : labelValue = "Enter Password";
    indicator == "name"
        ? hintValue = "e.g: Samarpan Dasgupta"
        : hintValue = "e.g: sam1246";
    indicator == "name" ? permission = false : permission = true;

    TextEditingController takeControl(String indicator) =>
        indicator == "name" ? this._nameIs : this._pwdIs;

    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: TextFormField(
        autofocus: !permission,
        obscureText: permission,
        maxLines: 1,
        maxLength: 10,
        controller: takeControl(indicator),
        validator: (String? _inputData) {
          if (_inputData!.length < 1 || _inputData.length > 10)
            return "Maximum Length 10 and Minimum Length 1";
          return null;
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelValue,
          labelStyle: TextStyle(fontSize: 16.0),
          hintText: hintValue,
          hintStyle: TextStyle(fontSize: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 5.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 150,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 16.0, color: Colors.redAccent),
              ),
              onPressed: () {
                Authenticate authenticate =
                    Authenticate(this._nameIs.text, this._pwdIs.text);
                authenticate.getAllData();
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff1dba18)),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Authenticate authenticate =
                      Authenticate(this._nameIs.text, this._pwdIs.text);
                  bool response = await authenticate.getData("login");
                  if (response) {
                    showAlertBox(context, "Log-in Successfully", "right",
                        "Enjoy This App", this._nameIs.text, authenticate);
                  } else {
                    showAlertBox(context, "Log-in Error", "wrong",
                        "Incorrect User Name or Password\n🙉🙉");
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
