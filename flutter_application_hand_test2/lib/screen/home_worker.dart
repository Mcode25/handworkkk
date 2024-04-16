import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/server_post.dart';
import 'package:flutter_application_1/screen/AccountDetilsWorker.dart';
import 'package:flutter_application_1/screen/Login.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({Key? key}) : super(key: key);

  @override
  _WorkerPageState createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  final TextEditingController _userNameTD = TextEditingController();
  final TextEditingController _nationalID = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postTitleTD = TextEditingController();
  final TextEditingController _postTextTD = TextEditingController();

  _clearTextInput() {
    _userNameTD.text = '';
    _nationalID.text = '';
    _phoneNumber.text = '';
    _city.text = '';
    _postTitleTD.text = '';
    _postTextTD.text = '';
  }

  _createTable() {
    Services.createTable().then((result) {
      if ('success' == result) {
        if (kDebugMode) {
          print('success to create table');
        }
      } else {
        if (kDebugMode) {
          print('failed to create table');
        }
      }
    });
  }

  _addPost() {
    _createTable();
    if (_userNameTD.text.isEmpty ||
        _nationalID.text.isEmpty ||
        _phoneNumber.text.isEmpty ||
        _city.text.isEmpty ||
        _postTitleTD.text.isEmpty ||
        _postTextTD.text.isEmpty) {
      if (kDebugMode) {
        print('Empty Field');
      }
      return;
    } else {
      Services.addPost(
        _userNameTD.text,
        _nationalID.text,
        _phoneNumber.text,
        _city.text,
        _postTitleTD.text,
        _postTextTD.text,
      ).then((result) {
        if ('success' == result) {
          _clearTextInput();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.blue,
              content: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.white),
                  Text(
                    'Post added',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home worker'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create a post',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _userNameTD,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nationalID,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    keyboardType:
                        TextInputType.number, // لتحديد لوحة المفاتيح كرقمية فقط
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          14), // لتحديد الحد الأقصى لعدد الأحرف
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')), // للسماح بالأرقام فقط
                    ],
                    decoration: const InputDecoration(
                      hintText: 'National ID',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _phoneNumber,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    keyboardType:
                        TextInputType.number, // لتحديد لوحة المفاتيح كرقمية فقط
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          11), // لتحديد الحد الأقصى لعدد الأحرف
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')), // للسماح بالأرقام فقط
                    ],
                    decoration: const InputDecoration(
                      hintText: 'phone number',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _city,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'city',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _postTitleTD,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _postTextTD,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Text post',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _addPost();
                    },
                    child: const Text(
                      'share now',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  VerticalDivider(), // خط رأسي
                  Container(
                    width: 35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // IconButton(
                        //   onPressed: _getPosts,
                        //   icon: Icon(Icons.refresh),
                        //   tooltip: 'Refresh',
                        // ),
                        // SizedBox(height: 20),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AccountDetailsWorkerPage())); 
                          },
                          icon: Icon(Icons.account_circle),
                          tooltip: 'Account Details',
                        ),
                        SizedBox(height: 20),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen())); 
                          },
                          icon: Icon(Icons.logout),
                          tooltip: 'Logout',
                        ),
                        SizedBox(height: 20),
                        IconButton(
                          onPressed: () {
                            // Navigate to Settings screen
                          },
                          icon: Icon(Icons.settings),
                          tooltip: 'Settings',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
