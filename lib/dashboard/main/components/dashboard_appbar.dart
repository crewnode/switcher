import 'package:flutter/material.dart';
import 'package:crewnode_switcher/utils/colours.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Text('CrewNode',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            // SizedBox(width: 5.0),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Color(0xff2b3044),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 12,
            //     vertical: 6,
            //   ),
            //   child: Text(
            //     'Placeholder Text',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 12
            //     )
            //   )
            // ),
            Spacer(),
            CircleAvatar(
                backgroundImage: AssetImage('assets/images/crewnode_icon.png'),
                backgroundColor: Color(Colours().averageBlue))
          ],
        ));
  }
}
