import 'package:flutter/material.dart';
import 'station_list_page.dart';  // StationListPage를 import합니다.
import 'seat_page.dart';  // SeatPage를 import합니다.

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departureStation = '선택';
  String arrivalStation = '선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매', textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역 선택 박스
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '출발역',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _navigateToStationList('departure'),
                    child: Text(
                      departureStation,
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 도착역 선택 박스
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '도착역',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _navigateToStationList('arrival'),
                    child: Text(
                      arrivalStation,
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 좌석 선택 버튼
            ElevatedButton(
              onPressed: (departureStation != '선택' && arrivalStation != '선택')
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeatPage(
                            departureStation: departureStation,
                            arrivalStation: arrivalStation,
                          ),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                '좌석 선택',
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

  // 역 선택 화면으로 이동하는 메서드
  void _navigateToStationList(String stationType) async {
    final selectedStation = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(stationType: stationType),
      ),
    );

    if (selectedStation != null) {
      setState(() {
        if (stationType == 'departure') {
          departureStation = selectedStation;
        } else {
          arrivalStation = selectedStation;
        }
      });
    }
  }
}
