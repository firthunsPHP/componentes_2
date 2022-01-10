import 'package:flutter/material.dart';

class FormModaL extends StatefulWidget {
  const FormModaL({Key? key}) : super(key: key);

  @override
  _FormModaLState createState() => _FormModaLState();
}

class _FormModaLState extends State<FormModaL> {
  GlobalKey<FormState> keyform = GlobalKey();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController passRepeatCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: keyform,
            child: formUI(),
          ),
        )
      ),
    );
  }

  Widget formUI(){
    return Column(
      children: [
        _formItemDesign(
        Icons.person,
        TextFormField(
          controller: nameCtrl,
          decoration: InputDecoration( labelText: 'Nombre' ),
          validator: validateName,
        )),
        _formItemDesign(
            Icons.mail,
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(labelText:  'Email'),
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            )
        ),
        _formItemDesign(
        Icons.perm_phone_msg_rounded,
            TextFormField(
              controller: mobileCtrl,
              decoration: InputDecoration(labelText:  'Telefono'),
              validator: validateMobile,
              keyboardType: TextInputType.phone,
              maxLength: 10,
            )

        ),
        _formItemDesign(
            Icons.lock,
            TextFormField(
              controller: passCtrl,
              decoration: InputDecoration(labelText:  'Contraseña'),
              obscureText: true,
              validator: passwordValidator,
            )),
        ElevatedButton(
            onPressed: ()=> save(),
            child: Text('Guardar')
        )
      ],
    );
  }

  _formItemDesign(icon, item){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: item,
        )
      ),
    );
  }

  String? validateName(String? value){
    String pattern = r'(^[a-zA-Z]*$)';
    RegExp regExp = RegExp(pattern);

    if ( value == null || value.isEmpty){
      return "El nombre es necesario";

    }else if( !regExp.hasMatch(value)){
      return "El nombre debe contener a-z y A-Z";
    }
    return null;
  }
  // ^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$
  String? validateEmail(String? value){
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = RegExp(pattern);

    if ( value == null || value.isEmpty){
      return "El email es necesario";

    }else if( !regExp.hasMatch(value)){
      return "El formato is incorrecto";
    }
    return null;
  }

  String? validateMobile(String? value){
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);

    if ( value == null || value.isEmpty){
      return "El telefono  es necesario";

    }else if( !regExp.hasMatch(value)){
      return "El formato is incorrecto";
    }
    return null;
  }

  String? passwordValidator(String? value){
if(value != passCtrl.text){
  return "Las contraseñas no coinciden";
}

  }

  save(){
    var valid = keyform.currentState?.validate();

    if(valid == true){
      Map<String, String> datos = {
        'nombre': nameCtrl.text,
        'email': emailCtrl.text,
        'telefono': mobileCtrl.text,
        'password': passCtrl.text,
      };
      Navigator.pop(context, datos);
    }
  }
}
