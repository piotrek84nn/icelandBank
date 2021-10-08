import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iceland/bloc/weather_bloc.dart';
import 'package:iceland/models/forecast/weather_model.dart';
import 'package:iceland/helpers/asset_manager.dart';
import 'package:iceland/helpers/extensions.dart';
import 'package:iceland/helpers/size_config.dart';
import 'package:iceland/helpers/text_styles.dart';
import 'package:iceland/view/weather_item.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final PageController controller = PageController(initialPage: 0);
    return _getScaffold(controller);
  }

  Scaffold _getScaffold(PageController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Demo', style: TextStyleManager.appBarStyle),
        backgroundColor: Colors.lightBlue,
      ),
      body: _blockBuilder(controller),
      floatingActionButton: _getRefreshBtn(),
    );
  }

  BlocBuilder _blockBuilder(PageController controller) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherInitial) {
        return _waitingStateContent(context);
      } else if (state is WeatherGettingData) {
        return _loadingStateContent(context);
      } else if (state is WeatherHasData) {
        return _activeStateContent(controller, state.current);
      } else if (state is WeatherNoData) {
        return _noDataStateContent(context, state.message);
      } else {
        return _noDataStateContent(context, 'General error !');
      }
    });
  }

  FloatingActionButton _getRefreshBtn() {
    return FloatingActionButton(
      onPressed: _loadData,
      tooltip: 'GetData',
      foregroundColor: Colors.white,
      backgroundColor: Colors.lightBlue,
      child: const Icon(Icons.refresh),
    );
  }

  Stack _waitingStateContent(BuildContext context) =>
      _infoContent(context, 'Press \'Refresh icon" to download data.');

  Stack _loadingStateContent(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      ImageManager.getBackgroundImage(context),
      ImageManager.mainScreenContainer(SafeArea(
          minimum: EdgeInsets.symmetric(
              vertical: SizeConfig.margin_24, horizontal: SizeConfig.margin_32),
          child: Center(
              child: ImageManager.getImage(AssetCode.workInProgress, 200))))
    ]);
  }

  Stack _noDataStateContent(BuildContext context, String message) => _infoContent(context, message);

  PageView _activeStateContent(PageController controller, Weather snapshot) {
    return PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, position) {
          var dayData = snapshot.forecast?.forecastday?[position].date;
          var dayHours = snapshot.forecast?.forecastday?[position].hour;
          return Stack(alignment: Alignment.topCenter, children: <Widget>[
            ImageManager.getBackgroundImage(context),
            ImageManager.mainScreenContainer(SafeArea(
                minimum: EdgeInsets.symmetric(
                    vertical: SizeConfig.margin_24,
                    horizontal: SizeConfig.margin_12),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                      Text(dayData.getStringDate(),
                          style: TextStyleManager.dayHeaderStyle),
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dayHours?.length,
                        itemBuilder: (context, index) {
                          var hourItem = dayHours?[index];
                          var iconUrl = hourItem?.condition?.getIconUrl;
                          return WeatherItem(
                              iconUrl: iconUrl, hourItem: hourItem);
                        },
                      )),
                    ]))))
          ]);
        });
  }

  Stack _infoContent(BuildContext context, String text) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      ImageManager.getBackgroundImage(context),
      ImageManager.mainScreenContainer(SafeArea(
          minimum: EdgeInsets.symmetric(
              vertical: SizeConfig.margin_24, horizontal: SizeConfig.margin_32),
          child: Center(
              child: Text(
            text,
            style: TextStyleManager.appBarStyle,
            textAlign: TextAlign.center,
          ))))
    ]);
  }

  void _loadData() {
    BlocProvider.of<WeatherBloc>(context).add(WeatherGetDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
