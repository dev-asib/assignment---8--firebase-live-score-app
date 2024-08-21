import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_live_score_app/data/entities/live_score_data.dart';
import 'package:firebase_live_score_app/ui/widgets/app_bar.dart';
import 'package:firebase_live_score_app/ui/widgets/live_score_card.dart';
import 'package:flutter/material.dart';

class LiveScoreScreen extends StatefulWidget {
  const LiveScoreScreen({super.key});

  @override
  State<LiveScoreScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  List<LiveScoreData> matchList = [];

  @override
  void initState() {
    super.initState();
    _getFootballMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: StreamBuilder(
        stream: firebaseFireStore.collection('football').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (snapshot.hasData == false) {
            return const Center(
              child: Text("Empty List"),
            );
          }

          matchList.clear();

          for (QueryDocumentSnapshot doc in snapshot.data?.docs ?? []) {
            matchList.add(
              LiveScoreData(
                matchName: doc.id,
                team1Name: doc.get('team1Name'),
                team2Name: doc.get('team2Name'),
                team1Score: doc.get('team1'),
                team2Score: doc.get('team2'),
              ),
            );
          }

          return ListView.builder(
            itemCount: matchList.length,
            itemBuilder: (context, index) {
              return LiveScoreCard(
                liveScoreData: matchList[index],
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _getFootballMatches() async {
    matchList.clear();
    final QuerySnapshot result =
    await firebaseFireStore.collection('football').get();

    for (QueryDocumentSnapshot doc in result.docs) {
      matchList.add(
        LiveScoreData(
          matchName: doc.id,
          team1Name: doc.get('team1Name'),
          team2Name: doc.get('team2Name'),
          team1Score: doc.get('team1'),
          team2Score: doc.get('team2'),
        ),
      );
    }
    setState(() {});
  }

}
