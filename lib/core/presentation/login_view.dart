import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import pub
import 'package:bot_toast/bot_toast.dart';

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
  late bool _emailClear;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _emailClear = false;
    _controllerEmail.addListener(() {
      if (_controllerEmail.text.isNotEmpty &&
          !_emailClear &&
          _emailFocusNode.hasFocus) {
        setState(() {
          _emailClear = true;
        });
      } else if (_controllerEmail.text.isEmpty && _emailClear) {
        setState(() {
          _emailClear = false;
        });
      } else if (!_emailFocusNode.hasFocus && _emailClear) {
        setState(() {
          _emailClear = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return keyboardDismiss(
      context: context,
      child: Scaffold(
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
        setState(() {
          _emailClear = false;
        });
      },
      child: child,
    );
    return gesture;
  }

  Widget page(BuildContext context) {
    final double heightStatusBar = MediaQuery.of(context).viewPadding.top;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topRight,
                colors: [
                  Colors.blue.shade600,
                  Colors.lightBlue.shade300,
                ],
                tileMode: TileMode.clamp,
              ),
            ),
            height: 200 + heightStatusBar,
          ),
        ),
        Positioned(
          top: 40 + heightStatusBar,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: header(context),
          ),
        ),
        Positioned.fill(
          top: 150 + heightStatusBar,
          bottom: 0,
          left: 0,
          right: 0,
          child: body(context),
        ),
      ],
    );
  }

  Widget header(BuildContext context) {
    return Image.asset('assets/images/flutter_logo.png');
  }

  Widget body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.grey.shade50,
      ),
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Login',
              key: Key('title'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            key: Key('btn_login'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              shadowColor: Colors.transparent,
              elevation: 0.0,
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              if (isValidate()) {
                //TODO: action login
              }
            },
            child: Text(
              'Login',
              key: Key('btn_login_label'),
            ),
          ),
          Expanded(
            child: SizedBox(),
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
          ),
        ],
      ),
    );
  }

  Widget emailTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 3,
          ),
          child: Text(
            'Email',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        TextFormField(
          key: Key('email_input'),
          focusNode: _emailFocusNode,
          controller: _controllerEmail,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
            setState(() {
              _emailClear = false;
            });
          },
          decoration: InputDecoration(
            hintText: 'Input email',
            contentPadding: EdgeInsets.zero,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blueAccent,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                if (_emailClear) {
                  _controllerEmail.clear();
                  setState(() {
                    _emailClear = false;
                  });
                }
              },
              icon: _emailClear
                  ? Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    )
                  : SizedBox(),
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 15,
            bottom: 3,
          ),
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        TextFormField(
          key: Key('password_input'),
          focusNode: _passwordFocusNode,
          controller: _controllerPassword,
          autofocus: false,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
          },
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            hintText: 'Input password',
            contentPadding: EdgeInsets.zero,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.blueAccent,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: _passwordVisible ? Colors.blueAccent : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        ),
      ],
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
    // RegExp must not contain spaces (?!.*\s)
    String pattern =
        r"^(?!.*\s)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void showWarningToast({
    required String title,
    required String subtitle,
  }) {
    BotToast.showNotification(
      title: (_) => Text(
        key: Key('toast_title'),
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: (_) => Text(
        key: Key('toast_subtitle'),
        subtitle,
      ),
      leading: (_) => Icon(
        size: 40,
        Icons.warning,
        color: Colors.redAccent,
      ),
      onlyOne: true,
      enableSlideOff: true,
      backButtonBehavior: BackButtonBehavior.none,
      duration: Duration(seconds: 3),
    );
  }

  bool isValidate() {
    print("isValid... email... ${_controllerEmail.text}");
    print("isValid... password... ${_controllerPassword.text}");
    //TODO: validator field and password
    String title = 'Warning';
    String warning = '';
    if (_controllerEmail.text.isEmpty || _controllerPassword.text.isEmpty) {
      warning = 'Please enter your full email and password';
    } else if (!isEmail(_controllerEmail.text)) {
      warning = 'The email is invalid. Please enter again';
    } else if (!isPassword(_controllerPassword.text)) {
      warning = 'The password must be 8 characters long,'
          ' must contain at least 1 uppercase letter, 1 lowercase letter, 1 number,'
          ' and must not contain spaces.'
          ' Please enter again';
    }
    if (warning.isNotEmpty) {
      showWarningToast(title: title, subtitle: warning);
      return false;
    }
    return true;
  }
}
