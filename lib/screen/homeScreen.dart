import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CupertinoColors.inactiveGray))),
        child: Row(
            children:
                List.generate(5, (index) => UserStory(userName: "park $index"))),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName)
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final FeedDataList = [
  FeedData(userName: 'user1', likeCount: 50, content: '오늘 점심은 맛있었다'),
  FeedData(userName: 'user2', likeCount: 20, content: '오늘 아침은 맛있었다'),
  FeedData(userName: 'user3', likeCount: 30, content: '오늘 고기은 맛있었다'),
  FeedData(userName: 'user4', likeCount: 10, content: '오늘 김치은 맛있었다'),
  FeedData(userName: 'user5', likeCount: 1, content: '오늘 점심은 맛없었다'),
  FeedData(userName: 'user6', likeCount: 0, content: '출근하기 싫다'),
  FeedData(userName: 'user7', likeCount: 534, content: '번아웃 왔다'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: FeedDataList.length,
      itemBuilder: (context, index) => FeedItem(
        feedData: FeedDataList[index],
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({super.key, required this.feedData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade300
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(feedData.userName)
                ]
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8,),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
              
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: Text('좋아요 ${feedData.likeCount}개', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text : feedData.userName, style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text : feedData.content),
            ],
            style: TextStyle(color: Colors.black),

          )),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
