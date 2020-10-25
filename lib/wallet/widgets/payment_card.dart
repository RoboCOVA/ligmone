import 'package:flutter/material.dart';
import 'package:ligmone/wallet/models/payment_model.dart';

class PaymentCardWidget extends StatefulWidget {
  final PaymentModel payment;

  const PaymentCardWidget({Key key, this.payment}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  final icons = [
    Icons.receipt,
    Icons.monetization_on,
    Icons.location_city,
    Icons.train,
  ];
  final colors = [
    Color(0xFFffd60f),
    Color(0xFFff415f),
    Color(0xFF50f3e2),
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color color;
    if (widget.payment.type == 1) {
      iconData = icons[0];
      color = colors[0];
    } else if (widget.payment.type == 2) {
      iconData = icons[1];
      color = colors[1];
    } else if (widget.payment.type == 3) {
      iconData = icons[2];
      color = colors[2];
    } else if (widget.payment.type == 4) {
      iconData = icons[3];
      color = colors[3];
    }

    return Container(
      child: ListTile(
        dense: true,
        trailing: Text(
          "${widget.payment.type > 0 ? "+" : "-"} \$ ${widget.payment.amount}",
          style: TextStyle(
              inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: color.withOpacity(0.4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  iconData,
                  color: color,
                ),
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.payment.name,
              style: TextStyle(
                  inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.payment.date,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                width: 20,
              ),
              Text(widget.payment.hour,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
