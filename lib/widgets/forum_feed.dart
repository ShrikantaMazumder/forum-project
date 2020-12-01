import 'package:flutter/material.dart';
import 'package:forum_project/services/auth.dart';
import 'package:forum_project/widgets/sign_in.dart';

class ForumFeed extends StatefulWidget {
  @override
  _ForumFeedState createState() => _ForumFeedState();
}

class _ForumFeedState extends State<ForumFeed> {
  bool isLoading = false;
  AuthMethods authMethods = AuthMethods();

  logOutFunc() {
    setState(() {
      isLoading = true;
    });
    authMethods.signOut().then((value) {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => SignInForm(toggleForm),
      //     ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text("Forum Feed"),
              actions: [
                GestureDetector(
                  onTap: () => logOutFunc(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.logout),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Text(
                "Forum Feed",
                style: TextStyle(color: Colors.white),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
  }
}
