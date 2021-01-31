import 'package:equatable/equatable.dart';
import 'package:fetch_data_by_bloc/postModel.dart';

class PostState extends Equatable {
  @override
  List<Object> get props => [];

}

class InitialState extends PostState {

}

class LoadingState extends PostState {

}

class FetchSuccess extends PostState {
  List<PostModel> posts;
  FetchSuccess({this.posts});
}

class ErrorState extends PostState {
  String message;
  ErrorState({this.message});
}