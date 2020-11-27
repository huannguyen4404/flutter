import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_app/models/comment.dart';
import 'package:infinite_app/services/api_comments.dart';

part '../events/comment_event.dart';

part '../states/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  static const ITEMS_PER_PAGE = 20;

  CommentBloc() : super(CommentStateInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is CommentFetchedEvent &&
        !(state is CommentStateSuccess &&
            (state as CommentStateSuccess).hasReachedEnd)) {
      try {
        //Check if "has reached end of a page"
        if (state is CommentStateInitial) {
          //first time loading page
          //1.get comments from API
          //2.yield CommentStateSuccess
          final comments = await fetchComments(ITEMS_PER_PAGE, 0);
          yield CommentStateSuccess(comments: comments, hasReachedEnd: false);
        } else if (state is CommentStateSuccess) {
          //load next page
          //if "next page is empty" => yield "CommentStateSuccess" with hasReachedEnd = true
          final currentState = state as CommentStateSuccess;
          int offset = currentState.comments.length;
          final comments = await fetchComments(ITEMS_PER_PAGE, offset);
          if (comments.isEmpty) {
            //change current state !
            yield currentState.cloneWith(hasReachedEnd: true);
          } else {
            //not empty, means "not reached end",
            yield CommentStateSuccess(
              comments: currentState.comments + comments, //merge 2 arrays
              hasReachedEnd: false,
            );
          }
        }
      } catch (exception) {
        yield CommentStateFailure();
      }
    }
  }
}