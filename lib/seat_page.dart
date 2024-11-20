import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Cupertino 관련 위젯과 함수 추가

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  // 생성자에서 출발역과 도착역을 받음
  SeatPage({
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<bool> seatSelection = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택', textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역과 도착역 표시
            Text(
              '${widget.departureStation} -> ${widget.arrivalStation}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 20),
            Text(
              '좌석 상태: 선택됨 / 선택안됨',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // 좌석 선택 화면
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: seatSelection[index] ? Colors.purple : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              seatSelection[index] = !seatSelection[index];
                            });
                          },
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // 예매 버튼
            ElevatedButton(
              onPressed: seatSelection.contains(true)
                  ? () {
                      _showConfirmationDialog();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '예매 하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 예매 확인 다이얼로그
  void _showConfirmationDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('예매 확인'),
          content: Text('선택한 좌석을 예매하시겠습니까?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
              },
            ),
            CupertinoDialogAction(
              child: Text('확인'),
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
                Navigator.pop(context); // HomePage로 돌아가기
              },
            ),
          ],
        );
      },
    );
  }
}
