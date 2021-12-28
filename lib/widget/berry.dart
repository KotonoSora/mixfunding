import 'package:flutter/material.dart';
import 'package:mixfunding/api.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/berry.dart';

class BerryDetail extends StatefulWidget {
  const BerryDetail({Key? key, required this.berry}) : super(key: key);

  final NamedAPIResource berry;

  @override
  State<BerryDetail> createState() => _BerryDetailState();
}

class _BerryDetailState extends State<BerryDetail> {
  bool _isFirstLoadRunning = true;

  Berry? _berry;

  void _firstLoad() {
    setState(() {
      _isFirstLoadRunning = true;
    });
    getBerryDetail(widget.berry.url).then((res) {
      setState(() {
        _berry = res;
      });
    });
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berry detail'),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(_berry?.toJson().toString() ?? ''),
              ],
            ),
    );
  }
}
