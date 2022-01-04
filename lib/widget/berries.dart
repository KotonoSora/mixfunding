import 'package:flutter/material.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/api.dart';
import 'package:mixfunding/widget/berry.dart';
import 'package:mixfunding/pub/infinite_list.dart';

class BerriesList extends StatefulWidget {
  const BerriesList({Key? key}) : super(key: key);

  @override
  State<BerriesList> createState() => _BerriesListState();
}

class _BerriesListState extends State<BerriesList> {
  String? _nextUrl = allBerries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berries"),
      ),
      body: InfiniteList<NamedAPIResource>(
        builder: (BuildContext context, List<NamedAPIResource> items,
                ScrollController scrollController) =>
            ListView.builder(
          controller: scrollController,
          itemCount: items.length,
          itemBuilder: (_, int index) => Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text(items[index].url),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BerryDetail(
                    berry: items[index],
                  ),
                ),
              ),
            ),
          ),
        ),
        placeholderBuilder: (_) => SizedBox(),
        onMoreItemsRequested: () {},
        fetcher: () {
          if (_nextUrl != null) {
            return getNamedResourceList(_nextUrl!).then((res) {
              setState(() {
                _nextUrl = res.next;
              });
              return res.results;
            });
          }
          return Future.delayed(Duration(seconds: 0), () => []);
        },
        moreItemsfetcher: () {
          if (_nextUrl != null) {
            return getNamedResourceList(_nextUrl!).then((res) {
              setState(() {
                _nextUrl = res.next;
              });
              return res.results;
            });
          }
          return Future.delayed(Duration(seconds: 0), () => []);
        },
        footerBuilder: (context) => Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
