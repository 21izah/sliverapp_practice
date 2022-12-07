// ignore_for_file: avoid_unnecessary_containers, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/user_id.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

class SignUPpage extends StatefulWidget {
  const SignUPpage({Key? key}) : super(key: key);

  @override
  State<SignUPpage> createState() => _SignUPpageState();
}

class _SignUPpageState extends State<SignUPpage> {
  bool passwordObscured = true;

// check for password and confirmed password
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _comfirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  final _firstnameController = TextEditingController();

  final _othernameController = TextEditingController();

  final _surnameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _comfirmpasswordController = TextEditingController();

  final _btcWalletController = TextEditingController();

  final _ethereumWalletController = TextEditingController();

  final _usdtTrc20WalletController = TextEditingController();

  final _usdtBep20Controller = TextEditingController();

  final _usdtPolygonController = TextEditingController();

  final _usdtSolanaController = TextEditingController();

  final _busdBep20Controller = TextEditingController();

  final _busdPolygonController = TextEditingController();

  final firebaseUser = FirebaseAuth.instance.currentUser;

  final docUsers = FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    _firstnameController.dispose();
    _othernameController.dispose();
    _surnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _comfirmpasswordController.dispose();
    _btcWalletController.dispose();
    _ethereumWalletController.dispose();
    _usdtTrc20WalletController.dispose();
    _usdtBep20Controller.dispose();
    _usdtPolygonController.dispose();
    _usdtSolanaController.dispose();
    _busdBep20Controller.dispose();
    _busdPolygonController.dispose();
    super.dispose();
  }

// sign up function
  Future signUp() async {
    // circular dialog
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
            backgroundColor: Colors.black,
            strokeWidth: 5,
            color: Colors.black,
          ));
        });

    if (passwordConfirmed()) {
      //create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      Future addUserDetails(
        String firstName,
        String otherName,
        String surName,
        String email,
        int phoneNumber,
        String btcWalletAddress,
        String ethWalletAddress,
        String usdtTrc20WalletAddress,
        String usdtBep20WalletAddress,
        String usdtPolygonWalletAddress,
        String usdtSolanaWalletAddress,
        String busdBep20walletAddress,
        String busdPolygonWalletAddress,
        String id,
      ) async {
        // create data to firebase firestore
        // var firebaseUser = await FirebaseAuth.instance.currentUser;

        FirebaseFirestore.instance.collection('users').add({
          'First Name': firstName,
          'Other Name': otherName,
          'Surname': surName,
          'Email': email,
          'Phone Number': phoneNumber,
          'BTC Wallet Address': btcWalletAddress,
          'Ethereum Wallet Address': ethWalletAddress,
          'USDT TRC-20 Wallet Address': usdtTrc20WalletAddress,
          'USDT BEP-20 Wallet Address': usdtBep20WalletAddress,
          'USDT Polygon Wallet Address': usdtPolygonWalletAddress,
          'USDT Solana Wallet Address': usdtSolanaWalletAddress,
          'BUSD BEP-20 WAllet Address': busdBep20walletAddress,
          'BUSD Polygon Wallet Address': busdPolygonWalletAddress,
          id: docUsers.id,
        });
      }

      // textfield controllers to get input from textfield

      addUserDetails(
        _firstnameController.text.trim(),
        _othernameController.text.trim(),
        _surnameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_phoneNumberController.text.trim()),
        _btcWalletController.text.trim(),
        _ethereumWalletController.text.trim(),
        _usdtTrc20WalletController.text.trim(),
        _usdtBep20Controller.text.trim(),
        _usdtPolygonController.text.trim(),
        _usdtSolanaController.text.trim(),
        _busdBep20Controller.text.trim(),
        _busdPolygonController.text.trim(),
        docUsers.id,
      );

      UserManagement();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SixthPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // title: const Text('hello'),
      ),
      body: ListView(children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            child: const Text(
              'Welcome',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 0.5,
        ),
        Center(
          child: Container(
            child: const Text(
              "Let's Know you better",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _firstnameController,
            decoration: InputDecoration(
                hintText: 'First Name',
                filled: true,
                fillColor: const Color(0xFFFFFFFF).withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _othernameController,
            decoration: InputDecoration(
                hintText: 'Other Name',
                filled: true,
                fillColor: const Color(0xFFFFFFFF).withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _surnameController,
            decoration: InputDecoration(
                hintText: 'Surname',
                filled: true,
                fillColor: const Color(0xFFFFFFFF).withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _usernameController,
            decoration: InputDecoration(
                hintText: 'Username',
                filled: true,
                fillColor: const Color(0xFFFFFFFF).withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            keyboardType: TextInputType.number,
            controller: _phoneNumberController,
            decoration: InputDecoration(
                hintText: 'Phone Number',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _btcWalletController,
            decoration: InputDecoration(
                hintText: 'BTC Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _ethereumWalletController,
            decoration: InputDecoration(
                hintText: 'Ethereum Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _usdtTrc20WalletController,
            decoration: InputDecoration(
                hintText: 'USDT TRC-20 Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _usdtBep20Controller,
            decoration: InputDecoration(
                hintText: 'USDT BEP-20 WAllet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //   keyboardType: TextInputType.emailAddress,
            controller: _usdtPolygonController,
            decoration: InputDecoration(
                hintText: 'USDT Polygon Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //  keyboardType: TextInputType.emailAddress,
            controller: _usdtSolanaController,
            decoration: InputDecoration(
                hintText: 'USDT Solana WAllet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            //  keyboardType: TextInputType.emailAddress,
            controller: _busdBep20Controller,
            decoration: InputDecoration(
                hintText: 'BUSD BEP-20 Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            // keyboardType: TextInputType.emailAddress,
            controller: _busdPolygonController,
            decoration: InputDecoration(
                hintText: 'BUSD Polygon Wallet Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _passwordController,
            obscureText: passwordObscured,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (() => setState(() {
                        passwordObscured = !passwordObscured;
                      })),
                  icon: Icon(
                    passwordObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.deepOrange,
                  ),
                ),
                hintText: 'Choose Password',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            controller: _comfirmpasswordController,
            obscureText: passwordObscured,
            cursorColor: Colors.deepOrange,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (() => setState(() {
                        passwordObscured = !passwordObscured;
                      })),
                  icon: Icon(
                    passwordObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.deepOrange,
                  ),
                ),
                hintText: 'Comfirm Password',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            child: const Text(
              "By clicking the SignUp button below you agree to Cza's",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Center(
          child: Container(
            child: const Text(
              'Terms and Service',
              style: TextStyle(fontSize: 15, color: Colors.orange),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.deepOrange,
                blurRadius: 15,
                offset: Offset(5, 5),
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(-10, -10),
                spreadRadius: 2,
              ),
            ],
          ),
          // height: 50,
          margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),
          child: GestureDetector(
              onTap: signUp,
              child: const Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              )),
        ),
        const SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}
