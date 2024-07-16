// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiIntegrationDemo extends StatefulWidget {
//   const ApiIntegrationDemo({super.key});
//
//   @override
//   _ApiIntegrationDemoState createState() => _ApiIntegrationDemoState();
// }
//
// class _ApiIntegrationDemoState extends State<ApiIntegrationDemo> {
//   final TextEditingController _controller = TextEditingController();
//   String _response = '';
//
//   final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//
//   Future<void> _submitData(String data) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: jsonEncode({'data': data}),
//         headers: {'Content-Type': 'application/json'},
//       );
//
//       if (response.statusCode == 201) {
//         setState(() {
//           _response = 'Data submitted successfully!';
//         });
//       } else {
//         setState(() {
//           _response = 'Failed to submit data!';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _response = 'Error: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Integration Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   hintText: 'Enter data',
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Submit data to the API when the button is pressed
//                 _submitData(_controller.text);
//               },
//               child: Text('Submit'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Reset the text field and response text when cancel button is pressed
//                 setState(() {
//                   _controller.clear();
//                   _response = '';
//                 });
//               },
//               child: Text('Cancel'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _response,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
