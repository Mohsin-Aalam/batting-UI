import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:tast_1/models/score_board.dart';

class DetailPage extends StatefulWidget {
  final ScoreBoard scoreBoard;

  const DetailPage({super.key, required this.scoreBoard});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("MY Scrore Board"),
            backgroundColor: Color.fromARGB(255, 230, 224, 224)),
        body: Column(
          children: [
            Card(
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
                          widget.scoreBoard.leagueFlag,
                          height: 20,
                          width: 20,
                          borderRadius: 2,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.scoreBoard.legueName,
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
                          widget.scoreBoard.leftTeam,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${widget.scoreBoard.leftTeamScore}-${widget.scoreBoard.rightTeamScore}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.scoreBoard.rightTeam,
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
                      widget.scoreBoard.leftTeamAvatar,
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
                              "${widget.scoreBoard.leftsubScore} | ${widget.scoreBoard.rigthSubScore}",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            )),
                          )
                        ]),
                    trailing:
                        // SizedBox(
                        //   height: 16,
                        // ),
                        Image.asset(widget.scoreBoard.rightTeamAvatar,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomRight),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
