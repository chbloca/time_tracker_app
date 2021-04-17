import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/form_submit_button.dart';
import 'package:time_tracker/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  const EmailSignInForm({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email;

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  void _submit() {
    // TODO: print email and password
    print('email: ${_emailController}, password: ${_passwordController}');
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'text@test.com',
        ),
      ),
      SizedBox(height: 8.0),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      FlatButton(
        child: Text(secondaryText),
        onPressed: _toggleFormType,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, // minimize the length of the column
        children: _buildChildren(),
      ),
    );
  }
}
