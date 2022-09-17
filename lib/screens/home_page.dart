import 'package:blog_minimal/screens/create_post.dart';
import 'package:blog_minimal/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String image;
  final String author;
  final String date;
Post({required this.title,required this.author,required this.date,required this.image});
}

class HomePage extends StatelessWidget {
  static const routeName='/home';
  HomePage({Key? key}) : super(key: key);
  final data = [
    Post(
      image: 'assets/images/ikigai.jpg',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/leader.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/minimal.jpg',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/colors.jpg',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
    Post(
      image: 'assets/images/leader.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Revamph Prompt',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const InkWell(
            child: CircleAvatar(
              backgroundImage:  AssetImage('assets/images/profile.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  const Positioned(
                    top: 6,
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFD810),
        elevation: 0,
        onPressed: () => null,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for articles, author, and tags',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your feed',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final post = data[index];
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: PostCellWidget(
                              title: post.title,
                              image: post.image,
                              author: post.author,
                              date: post.date,
                              onClick: () => null),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
