import 'package:flutter/material.dart';
import 'package:prototype/src/constants/assets.dart';

class CardEvent extends StatelessWidget {

  final String eventName;

  const CardEvent({Key? key, required this.eventName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 130,
              child: Image.asset(Assets.logo , fit: BoxFit.fitWidth,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                eventName,
                style: Theme.of(context).textTheme.bodyMedium?.merge(const TextStyle(color: Colors.white)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
