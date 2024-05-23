import 'package:flutter/material.dart';

// 我的-订单 Widget
class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
         padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '我的订单',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.folder, color: Colors.blue, size: 40),
                  SizedBox(height: 5),
                  Text('全部订单', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.account_balance_wallet, color: Colors.blue, size: 40),
                  SizedBox(height: 5),
                  Text('待付款', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue, size: 40),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '可约',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('待预约', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.hourglass_empty, color: Colors.blue, size: 40),
                  SizedBox(height: 5),
                  Text('待服务', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.attach_money, color: Colors.blue, size: 40),
                  SizedBox(height: 5),
                  Text('退款进度', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}