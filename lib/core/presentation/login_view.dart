import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _passwordVisible;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return keyboardDismiss(
      context: context,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: page(context),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  Widget keyboardDismiss({
    required BuildContext context,
    required Widget child,
  }) {
    final gesture = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChannels.textInput.invokeListMethod('TextInput.hide');
      },
      child: child,
    );
    return gesture;
  }

  Widget page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mixfunding'),
          Text('Login'),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                emailTextField(context),
                passwordTextField(context),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //	TODO action login
                print(_controllerEmail.text);
                print(_controllerPassword.text);
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget emailTextField(BuildContext context) {
    return TextFormField(
      controller: _controllerEmail,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email *',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter email';
        }
        return null;
      },
    );
  }

  Widget passwordTextField(BuildContext context) {
    return TextFormField(
      controller: _controllerPassword,
      autofocus: false,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: 'password',
        labelText: 'Password *',
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }
}
