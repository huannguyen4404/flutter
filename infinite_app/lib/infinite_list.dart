import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_app/blocs/comment_bloc.dart';

class InfiniteList extends StatefulWidget {
  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  CommentBloc _commentBloc;

  // Scroll controller
  final _scrollController = ScrollController();
  final _scrollThreadHold = 250.0;

  @override
  void initState() {
    super.initState();
    _commentBloc = BlocProvider.of(context);
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScrollExtent - currentScroll <= _scrollThreadHold) {
        _commentBloc.add(CommentFetchedEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentStateInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CommentStateFailure) {
            return Center(
              child: Text(
                'Can not load comments...',
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
            );
          }
          if (state is CommentStateSuccess) {
            if (state.comments.isEmpty) {
              return Center(child: Text('No comments here.'));
            }
            return ListView.builder(
                itemBuilder: (BuildContext buildContext, int index) {
                  if (index >= state.comments.length) {
                    return Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListTile(
                      leading: Text('${state.comments[index].id}'),
                      title: Text('${state.comments[index].email}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      isThreeLine: true,
                      subtitle: Text('${state.comments[index].body}',
                          style: TextStyle(fontSize: 18)),
                    );
                  }
                },
                itemCount: state.hasReachedEnd
                    ? state.comments.length
                    : state.comments.length + 1, //add more item
                controller: _scrollController);
          }
          return Center(
              child: Text(
                  'Other states..')); //never run this line, only fix warning.
        },
      )),
    );
  }
}
