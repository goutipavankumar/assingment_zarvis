import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DashboardPage extends StatefulWidget {
  final String qrData;

  const DashboardPage({Key? key, required this.qrData}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _name = '';
  String _email = '';
  String _mobile = '';

  @override
  void initState() {
    super.initState();
    // Parse the QR code data and extract user details
    _parseUserDetails(widget.qrData);
  }

  void _parseUserDetails(String qrData) {
    final lines = qrData.split('\n');
    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        final key = parts[0].trim();
        final value = parts[1].trim();
        if (key == 'Name') {
          _name = value;
        } else if (key == 'Email') {
          _email = value;
        } else if (key == 'Mobile') {
          _mobile = value;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: widget.qrData, // Displays the raw user details
              errorCorrectionLevel: QrErrorCorrectLevel.H,
              version: QrVersions.auto,
              gapless: true,
              backgroundColor: Colors.white,
              eyeStyle: QrEyeStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'User Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Name: $_name',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: $_email',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Mobile: $_mobile',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
