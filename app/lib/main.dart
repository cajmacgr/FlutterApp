import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  static const List<Widget> _pages = <Widget>[
    FeedPage(),
    PostPage(),
    ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        elevation: 8,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 40),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Post',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            //backgroundColor: Colors.orange,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List images = ["https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg",
    "https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554__340.jpg",
    "https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662__340.jpg",
    "https://cdn.pixabay.com/photo/2016/09/05/21/37/cat-1647775__340.jpg",
    "https://cdn.pixabay.com/photo/2019/05/08/21/21/cat-4189697__340.jpg",
    "https://cdn.pixabay.com/photo/2015/11/16/22/14/cat-1046544__340.jpg",
    "https://cdn.pixabay.com/photo/2017/04/30/18/33/kittens-2273598__340.jpg",
    "https://cdn.pixabay.com/photo/2019/05/21/07/11/cat-4218424__340.jpg",
    "https://cdn.pixabay.com/photo/2021/10/19/10/56/cat-6723256__340.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('My Feed'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(images[index]);
          },
          itemCount: images.length,
        )

    );
  }
}


class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  final _textController = TextEditingController();

  List posts = ["Hey guys welcome to my posts!", "I sure hope you all love cats as much as I do!", "Cats are literally the best! They are so cute and I am so happy my feed is full of them!"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Posts'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //change to listview builder
            Expanded(
              child: Container(
                child: Center(
                  child:ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(posts[index]),
                          //leading: CircleAvatar(backgroundImage: AssetImage('assets/ProfilePic.JPG'),),
                        )
                      );
                    },
                    itemCount: posts.length,
                ),
              ),
            ),
            ),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Write a post',
                border: OutlineInputBorder(),
                ),
              ),
            MaterialButton(
                onPressed: () {
                  posts.add(_textController.text);
                  print(posts);
                },
              color: Colors.blue,
              child: const Text('Post', style: TextStyle(color: Colors.white)),

            ),

          ],
        )
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('My Feed'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/ProfilePic.JPG'),
              radius: 40,
            ),
            Divider(
              height: 50,
              thickness: 2,
              color: Colors.black,
            ),
            Text(
              'Name:',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:10),
            Text(
              'Caleb MacGregor',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
            SizedBox(height:40),
            Text(
              'Age:',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:10),
            Text(
              '21 years old',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
            SizedBox(height:40),
            Text(
              'Biography:',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:10),
            Text(
              'Hello my name is Caleb MacGregor and I love cats!',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
          ],
        )
    )
    );
  }
}


