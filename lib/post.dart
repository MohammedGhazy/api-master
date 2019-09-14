import 'package:flutter/material.dart';
import 'package:api/model/post_model.dart';
import 'package:api/api/post_api.dart';
import 'package:api/home.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

PostApi postApi = PostApi();

class _PostScreenState extends State<PostScreen> {
  Widget buildItem() {
    return FutureBuilder<List<Post>>(
      future: postApi.getPosts(),
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (ctx, index) {
                return Container(
                  color: Colors.white60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapShot.data[index].title,
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        Text(
                          snapShot.data[index].body,
                          style: TextStyle(color: Colors.green, fontSize: 24.0),
                        ),
                        Divider(
                          height: 18,
                        )
                      ],
                    ),
                  ),
                );
              });
        } else if (snapShot.hasError) {
          return Text('${snapShot.error}');
        }
        return Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.green,
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('fake posts'),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.call_missed_outgoing),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>Home())
                  );
                }
            )
          ],
        ),
        body: buildItem());
  }
}
