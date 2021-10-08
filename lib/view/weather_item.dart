import 'package:flutter/material.dart';
import 'package:iceland/models/forecast/hour_model.dart';
import 'package:iceland/helpers/extensions.dart';
import 'package:iceland/helpers/text_styles.dart';

class WeatherItem extends StatelessWidget {
  final String? iconUrl;
  final Hour? hourItem;

  const WeatherItem({Key? key, required this.iconUrl, required this.hourItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Container(
            color: Colors.white,
            child: Image.network(
              iconUrl!,
              fit: BoxFit.cover,
              loadingBuilder:
                  (BuildContext context,
                  Widget child,
                  ImageChunkEvent?
                  loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child:
                  CircularProgressIndicator(
                    valueColor:
                    const AlwaysStoppedAnimation(
                        Colors.lightBlue),
                    value: loadingProgress
                        .expectedTotalBytes !=
                        null
                        ? loadingProgress
                        .cumulativeBytesLoaded /
                        loadingProgress
                            .expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          )),
      title: Text(
          _getFormattedRow(
              label: 'Time',
              value: hourItem?.time) +
              _getFormattedRow(
                  label: ' Temp',
                  value: hourItem?.temp_c),
          style: TextStyleManager.titleStyle),
      subtitle: Text(
          _getFormattedRow(
              label: 'Wind dir',
              value: hourItem?.wind_dir) +
              _getFormattedRow(
                  label: ' degree',
                  value:
                  hourItem?.wind_degree) +
              _getFormattedRow(
                  label: '\nCloud cover',
                  value: hourItem?.cloud),
          style:
          TextStyleManager.subtitleStyle),
    );
  }

  String _getFormattedRow({required String label, required Object? value}) {
    if (value == null) {
      return '$label: -';
    } else {
      switch (value.runtimeType) {
        case DateTime:
          return '$label: ' + (value as DateTime).getStringTime();
        case double:
        case int:
          return '$label: ' + (value as num).toStr();
        case String:
          return '$label: ' + (value as String).toStr();
        default:
          return '$label: -';
      }
    }
  }
}
