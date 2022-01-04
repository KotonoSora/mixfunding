// Author: khoadng
// Github: https://github.com/khoadng

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

extension ScrollControllerX on ScrollController {
  Stream<double> positionAsStream() {
    late StreamController<double> controller;

    void addListener() => controller.add(position.pixels);
    void onListen() => this.addListener(addListener);
    void onCancel() {
      removeListener(addListener);
      controller.close();
    }

    controller =
        StreamController<double>(onListen: onListen, onCancel: onCancel);

    return controller.stream;
  }
}

abstract class InfiniteListState<T> {}

class LoadingState<T> extends InfiniteListState<T> {
  LoadingState(this.currentItems);

  final List<T> currentItems;
}

class InitialState<T> extends InfiniteListState<T> {}

class LoadedState<T> extends InfiniteListState<T> {
  LoadedState(this.items);

  final List<T> items;
}

typedef FutureListItemFetcher<T> = Future<List<T>> Function();

class _ScrollPayload<T> {
  _ScrollPayload(this.shouldIgnore, this.data);

  final bool shouldIgnore;
  final T? data;
}

class InfiniteList<T> extends StatefulWidget {
  const InfiniteList({
    Key? key,
    this.additionItemsLoadThreshold,
    required this.builder,
    required this.placeholderBuilder,
    required this.fetcher,
    required this.moreItemsfetcher,
    this.scrollController,
    this.onMoreItemsRequested,
    this.footerBuilder,
  }) : super(key: key);

  final ScrollView Function(BuildContext context, List<T> items,
      ScrollController scrollController) builder;
  final Widget Function(BuildContext context) placeholderBuilder;
  final FutureListItemFetcher<T> fetcher;
  final FutureListItemFetcher<T> moreItemsfetcher;
  final ScrollController? scrollController;
  final VoidCallback? onMoreItemsRequested;
  final Widget Function(BuildContext context)? footerBuilder;

  final double? additionItemsLoadThreshold;

  @override
  State<InfiniteList> createState() => _InfiniteListState<T>();
}

class _InfiniteListState<T> extends State<InfiniteList<T>> {
  List<T> items = <T>[];
  int page = 0;

  ValueNotifier<bool> isLoadingMore = ValueNotifier(false);

  late ScrollController scrollController;

  final StreamController<InfiniteListState<T>> stateStream =
      StreamController.broadcast();
  final CompositeSubscription compositeSubscription = CompositeSubscription();

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController ?? ScrollController();

    stateStream.stream.listen((event) async {
      void _load(FutureListItemFetcher<T> fetcher,
          {VoidCallback? onDone}) async {
        final items = await fetcher();
        page = page + 1;
        this.items.addAll(items);
        stateStream.add(LoadedState(items));
        onDone?.call();
        setState(() {});
      }

      if (event is InitialState) {
        _load(widget.fetcher);
      } else if (event is LoadingState) {
        isLoadingMore.value = true;
        widget.onMoreItemsRequested?.call();
        _load(
          widget.moreItemsfetcher,
          onDone: () => isLoadingMore.value = false,
        );
      } else if (event is LoadedState) {}
    }).addTo(compositeSubscription);

    scrollController
        .positionAsStream()
        // .throttleTime(const Duration(milliseconds: 200))
        .distinct()
        .withLatestFrom<InfiniteListState<T>, _ScrollPayload<double>>(
            stateStream.stream,
            (t, s) => s is LoadedState
                ? _ScrollPayload(false, t)
                : _ScrollPayload(true, null))
        .where((event) => !event.shouldIgnore) // Only apply when list is loaded
        .map((event) => event.data!) // Extract postion from payload
        .pairwise()
        .where((event) => event.last > event.first) // Only scroll down
        // .where((event) =>
        //     event.last - event.first > min(MediaQuery.of(context).size.height * 0.05, 50)) // Skip tiny position changed
        .map((event) => event.last) // Pick latest value
        .where((p) =>
            p >
            (widget.additionItemsLoadThreshold ?? 0.8) *
                scrollController.position.maxScrollExtent)
        .listen((event) => stateStream.add(LoadingState(items)))
        .addTo(compositeSubscription);

    stateStream.add(InitialState());
  }

  @override
  void dispose() {
    compositeSubscription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? _ScrollableWithFooter(
            child: widget.builder(context, items, scrollController),
            footerBuilder: (context) =>
                widget.footerBuilder?.call(context) ??
                const Center(child: CircularProgressIndicator()))
        : widget.placeholderBuilder(context);
  }
}

class _ScrollableWithFooter extends StatelessWidget {
  const _ScrollableWithFooter({
    Key? key,
    required this.child,
    required this.footerBuilder,
  }) : super(key: key);

  final ScrollView child;
  final Widget Function(BuildContext) footerBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: child.controller,
      scrollDirection: child.scrollDirection,
      itemCount: 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Scrollable(
            physics: const NeverScrollableScrollPhysics(),
            axisDirection: child.getDirection(context),
            viewportBuilder: (context, offset) {
              return ShrinkWrappingViewport(
                axisDirection: child.getDirection(context),
                offset: offset,
                slivers: child.buildSlivers(context),
              );
            },
          );
        }
        return footerBuilder(context);
      },
    );
  }
}
