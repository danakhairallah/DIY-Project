import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenge_provider.dart';
import '../utils/app_localizations.dart';

class MyChallengesPage extends StatelessWidget {
  const MyChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final myChallenges = Provider.of<ChallengeProvider>(context).myChallenges;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.translate("my_challenges")),
      ),
      body: myChallenges.isEmpty
          ? Center(child: Text(loc.translate("no_challenges_yet")))
          : ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        itemCount: myChallenges.length,
        itemBuilder: (context, index) {
          final challenge = myChallenges[index];
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.01,
              vertical: size.height * 0.01,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.015,
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.15,
                    height: size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(challenge.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: Text(
                      loc.translate(challenge.title),
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/upload');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.012,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: FittedBox(
                      child: Text(
                        loc.translate("submit_result"),
                        style: TextStyle(fontSize: size.width * 0.035),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red, size: size.width * 0.07),
                    onPressed: () {
                      Provider.of<ChallengeProvider>(context, listen: false)
                          .removeFromMyChallenges(challenge.id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
