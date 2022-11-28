import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp_mobile/providers/auth_provider.dart';
import 'package:sportsapp_mobile/providers/login_form_provider.dart';
import 'package:sportsapp_mobile/ui/input_decorations.dart';
import 'package:sportsapp_mobile/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          CardContainer(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.login,
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 30,
              ),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.createAccount,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ))),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
        child: Form(
            key: loginForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: AppLocalizations.of(context)!.mailHint,
                      labelText: AppLocalizations.of(context)!.email,
                      prefixIcon: Icons.alternate_email_rounded),
                  onChanged: (value) => loginForm.correo = value,
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : AppLocalizations.of(context)!.invalidMail;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '******',
                      labelText: AppLocalizations.of(context)!.password,
                      prefixIcon: Icons.lock),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    return (value != null && value.length >= 6)
                        ? null
                        : AppLocalizations.of(context)!.passValidation;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                    onPressed: loginForm.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();
                            if (!loginForm.isValidForm()) return;
                            loginForm.isLoading = true;
                            await Future.delayed(Duration(seconds: 2));
                            loginForm.isLoading = false;
                            Navigator.pushReplacementNamed(context, 'home');
                          },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.deepPurple,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(loginForm.isLoading ? 'Espere' : 'Ingresar',
                          style: TextStyle(color: Colors.white)),
                    )),
              ],
            )));
  }
}
