import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _countryCode = '+1';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account On ProceApp'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(height: 20),
              // First Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  _firstName = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Last Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  _lastName = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _email = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Country Code + Phone Number Field
              Row(
                children: <Widget>[
                  // Country Code Dropdown
                  SizedBox(
                    width: 100,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      value: _countryCode,
                      onChanged: (newValue) {
                        setState(() {
                          _countryCode = newValue!;
                        });
                      },
                      items: <String>['+1', '+44', '+91', '+234'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _phoneNumber = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Password Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onSaved: (value) {
                  _password = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Confirm Password Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onSaved: (value) {
                  _confirmPassword = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm your password';
                  } else if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              // Register Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Navigate to login or process registration
                      Navigator.of(context).pushReplacementNamed('/login');
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // TextButton for Login Navigation
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text(
                    'Already have an account? Login here',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
