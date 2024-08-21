import 'package:firebase_live_score_app/data/entities/live_score_data.dart';
import 'package:firebase_live_score_app/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class LiveScoreCard extends StatelessWidget {
  const LiveScoreCard({
    super.key,
    required this.liveScoreData,
  });

  final LiveScoreData liveScoreData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.blackColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTeam(
                  context: context,
                  score: liveScoreData.team1Score,
                  teamName: liveScoreData.team1Name,
                ),
                Text(
                  "VS",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                _buildTeam(
                  context: context,
                  score: liveScoreData.team2Score,
                  teamName: liveScoreData.team2Name,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeam({
    required BuildContext context,
    required int score,
    required String teamName,
  }) {
    return Column(
      children: [
        buildText(context, score.toString()),
        buildText(context, teamName),
      ],
    );
  }

  Text buildText(BuildContext context, String score) {
    return Text(
      score.toString(),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
