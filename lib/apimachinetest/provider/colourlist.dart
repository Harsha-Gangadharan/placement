import 'package:flutter/material.dart';
import 'package:placement/apimachinetest/provider/colourprovider.dart';
import 'package:provider/provider.dart';


class ColorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Colors')),
      body: Consumer<ColorProvider>(
        builder: (context, colorProvider, child) {
          if (colorProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (colorProvider.colors.isEmpty) {
            return Center(child: Text('No colors available'));
          }

          return ListView.builder(
            itemCount: colorProvider.colors.length,
            itemBuilder: (context, index) {
              final colorData = colorProvider.colors[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(int.parse(
                    colorData['color'].substring(1, 7),
                    radix: 16,
                  ) + 0xFF000000),
                ),
                title: Text(colorData['name']),
                subtitle: Text('Year: ${colorData['year']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorDetailPage(colorData: colorData),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ColorDetailPage extends StatelessWidget {
  final Map<String, dynamic> colorData;

  ColorDetailPage({required this.colorData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(colorData['name'])),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Color(int.parse(
                colorData['color'].substring(1, 7),
                radix: 16,
              ) + 0xFF000000),
            ),
            SizedBox(height: 20),
            Text('Name: ${colorData['name']}', style: TextStyle(fontSize: 20)),
            Text('Year: ${colorData['year']}', style: TextStyle(fontSize: 16)),
            Text('Pantone Value: ${colorData['pantone_value']}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
