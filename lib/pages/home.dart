import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> posts = [
    {
      'userName': 'Cristiano Ronaldo',
      'userImage':
          'https://upload.wikimedia.org/wikipedia/commons/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg',
      'tweetContent': 'Siuuuuuuu!',
      'postImage': 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg', 
    },
    {
      'userName': 'Lionel Messi',
      'userImage':
          'https://cdn.conmebol.com/wp-content/uploads/2023/06/000_334P84K-scaled.jpg',
      'tweetContent': 'Vamos Argentina!',
      'postImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF9HnDuB4edNFNSIhpZHRn3GwCG_1bv0ivaA&s',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post['userImage']),
                ),
                 title: Text(
                  post['userName'],
                  style: const TextStyle(color: Colors.white), 
                ),
                subtitle: Text(
                  post['tweetContent'],
                  style: const TextStyle(color: Colors.white), 
                ),
              ),
               if (post.containsKey('postImage') && post['postImage'] != null)
                Container( 
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0), 
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), 
                  child: ClipRRect( 
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      post['postImage'],
                      fit: BoxFit.cover, 
                    ),
                  ),
                ),
              const Divider(), 
            ],
          );
        },
      ),
    );
  }
}
