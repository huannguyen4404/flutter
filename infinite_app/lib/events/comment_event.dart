part of '../blocs/comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentFetchedEvent extends CommentEvent {}