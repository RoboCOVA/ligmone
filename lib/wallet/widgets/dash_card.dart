import 'package:flutter/material.dart';
import 'package:ligmone/wallet/models/dash_model.dart';

class DashCardWidget extends StatelessWidget {
  final DashModel dashCard;
  const DashCardWidget({Key key, this.dashCard})
      : assert(dashCard != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.shade50,
            blurRadius: 8.0,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: dashCard.color.withOpacity(0.4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: dashCard.color,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  dashCard.icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              dashCard.name,
              style: TextStyle(
                  inherit: true,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.black),
              // overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
