import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/server_post.dart';
import 'package:flutter_application_1/screen/AccountDetilsUsers.dart';
import 'package:flutter_application_1/screen/Login.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List _posts = [];

  @override
  void initState() {
    _getPosts();
    super.initState();
  }

  Future<void> _getPosts() async {
    Services.getAllPosts().then((posts) {
      setState(() {
        _posts = posts;
      });
      if (kDebugMode) {
        print('Length: ${_posts.length}');
      }
    });
  }

    _deletePost(String selectPostId) {
    Services.deletePost(selectPostId).then((result) {
      if ('success' == result) {
        _getPosts();
        if (kDebugMode) {
          print('Delete done');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home user'),
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          Expanded(
            child: _posts.isEmpty
                ? const Center(
                    child: Text(
                      'There is no post',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _getPosts,
                    backgroundColor: Colors.blue,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffEBEBEB),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: Colors.blue, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 20,
                                            ),
                                            color: Colors.red,
                                            onPressed: () {
                                              _deletePost(_posts[index].id);
                                            },
                                          ),
                                          // IconButton(
                                          //   icon: const Icon(
                                          //     Icons.edit,
                                          //     size: 20,
                                          //   ),
                                          //   color: Colors.blue,
                                          //   onPressed: () {
                                          //     Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) => EditPost(
                                          //                 postId: _posts[index].id,
                                          //                 username: _posts[index].username,
                                          //                 postTitle: _posts[index].postTitle,
                                          //                 postText: _posts[index].postText,
                                          //               )),
                                          //     );
                                          //   },
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${_posts[index].username}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.person,
                                            size: 35,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_posts[index].phonenumber}',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_posts[index].city}',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_posts[index].postTitle}',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SelectableText(
                                    '${_posts[index].postText}',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          VerticalDivider(),
          Container(
            width: 35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _getPosts,
                  icon: Icon(Icons.refresh),
                  tooltip: 'Refresh',
                ),
                SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AccountDetailsPage())); 
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
    );
  }
}