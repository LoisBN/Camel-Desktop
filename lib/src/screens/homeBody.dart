import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;
import 'data.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: (MediaQuery.of(context).size.width - 310),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(top:70,left:80,right:80,bottom:40),
              child: Text("Camel Analytics",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400)),
            ),
            Divider(),
            SizedBox(height: 40,),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              direction: Axis.horizontal,
              children: <Widget>[
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: lineData,
                    scales: {
                      'Date': graphic.CatScale(
                        accessor: (map) => map['Date'] as String,
                        range: [0, 1],
                        tickCount: 5,
                      ),
                      'Close': graphic.NumScale(
                        accessor: (map) => map['Close'] as num,
                        nice: true,
                        min: 100,
                      )
                    },
                    geoms: [
                      graphic.AreaGeom(
                        position: graphic.PositionAttr(field: 'Date*Close'),
                        shape: graphic.ShapeAttr(
                            values: [graphic.Shapes.smoothArea]),
                        color: graphic.ColorAttr(values: [
                          graphic.Defaults.theme.colors.first.withAlpha(80),
                        ]),
                      ),
                      graphic.LineGeom(
                        position: graphic.PositionAttr(field: 'Date*Close'),
                        shape: graphic.ShapeAttr(
                            values: [graphic.Shapes.smoothLine]),
                        size: graphic.SizeAttr(values: [0.5]),
                      ),
                    ],
                    axes: {
                      'Date': graphic.Defaults.horizontalAxis,
                      'Close': graphic.Defaults.verticalAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                        range: [0, 1],
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        nice: true,
                      ),
                    },
                    geoms: [
                      graphic.LineGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                        shape: graphic.ShapeAttr(
                            values: [graphic.Shapes.smoothLine]),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.horizontalAxis,
                      'value': graphic.Defaults.verticalAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                        range: [0, 1],
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        max: 1800,
                      ),
                    },
                    geoms: [
                      graphic.AreaGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                        shape: graphic.ShapeAttr(
                            values: [graphic.Shapes.smoothArea]),
                        adjust: graphic.StackAdjust(),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.horizontalAxis,
                      'value': graphic.Defaults.verticalAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        nice: true,
                      ),
                    },
                    coord: graphic.PolarCoord(),
                    geoms: [
                      graphic.LineGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.circularAxis,
                      'value': graphic.Defaults.radialAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        nice: true,
                        max: 1800,
                      ),
                    },
                    coord: graphic.PolarCoord(),
                    geoms: [
                      graphic.AreaGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                        adjust: graphic.StackAdjust(),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.circularAxis,
                      'value': graphic.Defaults.radialAxis..label = null,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: basicData,
                    scales: {
                      'genre': graphic.CatScale(
                        accessor: (map) => map['genre'] as String,
                      ),
                      'sold': graphic.NumScale(
                        accessor: (map) => map['sold'] as num,
                        nice: true,
                      )
                    },
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'genre*sold'),
                        shape: graphic.ShapeAttr(values: [
                          graphic.Shapes.rrectInterval(
                              radius: Radius.circular(5))
                        ]),
                      )
                    ],
                    axes: {
                      'genre': graphic.Defaults.horizontalAxis,
                      'sold': graphic.Defaults.verticalAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        nice: true,
                      ),
                    },
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                        adjust: graphic.DodgeAdjust(),
                        size: graphic.SizeAttr(values: [4]),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.horizontalAxis,
                      'value': graphic.Defaults.verticalAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        max: 2000,
                      ),
                    },
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                        adjust: graphic.StackAdjust(),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.horizontalAxis,
                      'value': graphic.Defaults.verticalAxis,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: basicData,
                    scales: {
                      'genre': graphic.CatScale(
                        accessor: (map) => map['genre'] as String,
                      ),
                      'sold': graphic.NumScale(
                        accessor: (map) => map['sold'] as num,
                        nice: true,
                      )
                    },
                    coord: graphic.PolarCoord(),
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'genre*sold'),
                        color: graphic.ColorAttr(field: 'genre'),
                      )
                    ],
                    axes: {
                      'genre': graphic.Defaults.circularAxis,
                      'sold': graphic.Defaults.radialAxis..label = null,
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: basicData,
                    scales: {
                      'genre': graphic.CatScale(
                        accessor: (map) => map['genre'] as String,
                      ),
                      'sold': graphic.NumScale(
                        accessor: (map) => map['sold'] as num,
                        nice: true,
                      )
                    },
                    coord:
                        graphic.PolarCoord(transposed: true, innerRadius: 0.5),
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'genre*sold'),
                        color: graphic.ColorAttr(field: 'genre'),
                      )
                    ],
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.all(20),
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: adjustData,
                    scales: {
                      'index': graphic.CatScale(
                        accessor: (map) => map['index'].toString(),
                      ),
                      'type': graphic.CatScale(
                        accessor: (map) => map['type'] as String,
                      ),
                      'value': graphic.NumScale(
                        accessor: (map) => map['value'] as num,
                        max: 1800,
                        tickCount: 5,
                      ),
                    },
                    coord: graphic.PolarCoord(),
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'index*value'),
                        color: graphic.ColorAttr(field: 'type'),
                        adjust: graphic.StackAdjust(),
                      )
                    ],
                    axes: {
                      'index': graphic.Defaults.circularAxis..top = true,
                      'value': graphic.Defaults.radialAxis
                        ..grid = null
                        ..top = true
                        ..label.style =
                            TextStyle(color: Colors.white, fontSize: 10)
                        ..label.offset = Offset(-4, 0),
                    },
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: List.from(basicData)
                      ..sort((a, b) => (b['sold'] as num) - (a['sold'] as num)),
                    scales: {
                      'genre': graphic.CatScale(
                        accessor: (map) => map['genre'] as String,
                        range: [0.2, 0.9],
                      ),
                      'sold': graphic.NumScale(
                        max: 200,
                        min: -200,
                        accessor: (map) => map['sold'] as num,
                        nice: true,
                      )
                    },
                    coord: graphic.CartesianCoord(transposed: true),
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'genre*sold'),
                        shape: graphic.ShapeAttr(
                            values: [graphic.Shapes.pyramidInterval]),
                        color: graphic.ColorAttr(field: 'genre'),
                        adjust: graphic.SymmetricAdjust(),
                      )
                    ],
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.all(20),
                  ),
                )),
                Card(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  width: (MediaQuery.of(context).size.width - 450) / 3,
                  height: MediaQuery.of(context).size.height - 600,
                  child: graphic.Chart(
                    data: List.from(basicData)
                      ..sort((a, b) => (b['sold'] as num) - (a['sold'] as num)),
                    scales: {
                      'genre': graphic.CatScale(
                        accessor: (map) => map['genre'] as String,
                        range: [0.9, 0.2],
                      ),
                      'sold': graphic.NumScale(
                        max: 200,
                        min: -200,
                        accessor: (map) => map['sold'] as num,
                        nice: true,
                      )
                    },
                    coord: graphic.CartesianCoord(transposed: true),
                    geoms: [
                      graphic.IntervalGeom(
                        position: graphic.PositionAttr(field: 'genre*sold'),
                        shape: graphic.ShapeAttr(
                            values: [graphic.Shapes.funnelInterval]),
                        color: graphic.ColorAttr(field: 'genre'),
                        adjust: graphic.SymmetricAdjust(),
                      )
                    ],
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.all(20),
                  ),
                )),
              ],
            )
          ])),
    );
  }
}
