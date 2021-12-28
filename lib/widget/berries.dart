import 'package:flutter/material.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/api.dart';
import 'package:mixfunding/widget/berry.dart';

class BerriesList extends StatefulWidget {
  const BerriesList({Key? key}) : super(key: key);

  @override
  State<BerriesList> createState() => _BerriesListState();
}

class _BerriesListState extends State<BerriesList> {
  String _nextUrl = '';

  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<NamedAPIResource> _berries = [];

  void _firstLoad() {
    setState(() {
      _isFirstLoadRunning = true;
    });
    getBerries(allBerries).then((res) {
      setState(() {
        _berries = res.results;
        _nextUrl = res.next ?? '';
      });
    });
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() {
    if (_isLoadMoreRunning == true) return;
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _controller.position.extentAfter < 1000) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      if (_nextUrl.isNotEmpty) {
        getBerries(_nextUrl).then((res) {
          if (res.results.isNotEmpty) {
            setState(() {
              _berries.addAll(res.results);
              _nextUrl = res.next ?? '';
            });
          } else {
            setState(() {
              _hasNextPage = false;
            });
          }
        }).then((res) {
          setState(() {
            _isLoadMoreRunning = false;
          });
        });
      }
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berries List'),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _berries.length,
                    itemBuilder: (_, int index) => Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      child: ListTile(
                        title: Text(_berries[index].name),
                        subtitle: Text(_berries[index].url),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BerryDetail(
                              berry: _berries[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 40,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                    ),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('fetched all berries'),
                    ),
                  ),
              ],
            ),
    );
  }
}
