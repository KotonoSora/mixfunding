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
        body: SafeArea(
          child: page(context),
        ),
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
          SizedBox(
            height: 30,
          ),
          Text(
            'Login with email',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                //TODO: redirect to screen forgot password
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //TODO: action login
                print(_controllerEmail.text);
                print(_controllerPassword.text);
              }
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  //TODO: redirect to screen sign up
                },
                child: Text('Sign Up'),
              ),
            ],
          )
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
        hintText: 'your-email@domain.com',
        labelText: 'Email',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter email';
        }
        if (!isEmail(value)) {
          return 'Please enter a valid email address.';
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
        hintText: '',
        labelText: 'Password',
        errorMaxLines: 5,
        suffixIcon: IconButton(
          icon: Icon(
            !_passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
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
        if (!isPassword(value)) {
          return 'Your password is weak! Strong password required:'
              '\n- at least 8 characters'
              '\n- must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number'
              '\n- Can contain special characters';
        }
        return null;
      },
    );
  }

  bool isEmail(String value) {
    // RegExp copy from https://regexr.com/2rhq7
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isPassword(String value) {
    // RegExp copy from https://regexr.com/3bfsi
    String pattern = r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
