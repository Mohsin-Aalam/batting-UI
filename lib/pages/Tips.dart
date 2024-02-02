import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:tast_1/models/score_board.dart';
import 'package:tast_1/pages/detail_page.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  List<ScoreBoard> teams = [
    ScoreBoard(
        legueName: "Premier League",
        leagueFlag: "US",
        leftTeam: "Bomouth",
        rightTeam: "WestHam",
        rightTeamScore: 0,
        leftTeamScore: 4,
        leftTeamAvatar: "assets/images/mypng3.png",
        rightTeamAvatar: "assets/images/mypng4.png",
        leftsubScore: "under 3.5",
        rigthSubScore: "1.30"),
    ScoreBoard(
        legueName: "Premier League",
        leagueFlag: "US",
        leftTeam: "Newcastle",
        rightTeam: "Tottenham",
        rightTeamScore: 6,
        leftTeamScore: 1,
        leftTeamAvatar: "assets/images/mypng5.png",
        rightTeamAvatar: "assets/images/mypng6.png",
        leftsubScore: "1X",
        rigthSubScore: "1.30"),
    ScoreBoard(
        legueName: "Ligue 1",
        leagueFlag: "FR",
        leftTeam: "Ajaccie",
        rightTeam: "Brestes",
        rightTeamScore: 0,
        leftTeamScore: 0,
        leftTeamAvatar: "assets/images/mypng7.png",
        rightTeamAvatar: "assets/images/mypng8.png",
        leftsubScore: "X2",
        rigthSubScore: "1.35"),
    ScoreBoard(
        legueName: "Ligue 1",
        leagueFlag: "BR",
        leftTeam: "Nantes",
        rightTeam: "Troyes",
        rightTeamScore: 2,
        leftTeamScore: 2,
        leftTeamAvatar: "assets/images/mypng9.png",
        rightTeamAvatar: "assets/images/mypng10.png",
        leftsubScore: "1",
        rigthSubScore: "1.70"),
    ScoreBoard(
        legueName: "Premier League",
        leagueFlag: "US",
        leftTeam: "Bomouth",
        rightTeam: "West Ham",
        rightTeamScore: 0,
        leftTeamScore: 4,
        leftTeamAvatar: "assets/images/mypng3.png",
        rightTeamAvatar: "assets/images/mypng4.png",
        leftsubScore: "under 3.5 ",
        rigthSubScore: "1.30"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      scoreBoard: team,
                    ),
                  ));
            },
            child: Card(
              margin: EdgeInsets.all(8),
              color: Color(0xFF0D1D2D),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        color: Color(0xFF39375C),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      children: [
                        CountryFlag.fromCountryCode(
                          team.leagueFlag,
                          height: 20,
                          width: 20,
                          borderRadius: 2,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          team.legueName,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          team.leftTeam,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${team.leftTeamScore}-${team.rightTeamScore}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          team.rightTeam,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    leading:
                        // SizedBox(
                        //   height: 16,
                        Image.asset(
                      team.leftTeamAvatar,
                      height: 40,
                      width: 40,
                      alignment: Alignment.bottomLeft,
                    ),
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 44,
                          ),
                          Container(
                            width: 150,
                            height: 28,
                            decoration: const BoxDecoration(
                                color: Color(0xFF848484),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6))),
                            child: Center(
                                child: Text(
                              "${team.leftsubScore} | ${team.rigthSubScore}",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            )),
                          )
                        ]),
                    trailing:
                        // SizedBox(
                        //   height: 16,
                        // ),
                        Image.asset(team.rightTeamAvatar,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomRight),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
