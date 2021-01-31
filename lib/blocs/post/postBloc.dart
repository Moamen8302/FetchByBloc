import 'package:fetch_data_by_bloc/Storage/postData.dart';
import 'package:fetch_data_by_bloc/blocs/post/postEvents.dart';
import 'package:fetch_data_by_bloc/blocs/post/postState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  PostData data ;
  PostBloc(PostState initialState, this.data) : super(initialState);

  @override
  Stream<PostState> mapEventToState(PostEvents event) async* {
    if(event is OpenEvent) {
      yield LoadingState();
      try {
        var posts = await data.fetchPost();
        if(posts != null) {
          yield FetchSuccess(posts: posts);
        } else {
          yield LoadingState();
        }
      } catch(e) {
        yield ErrorState(message: e.toString());
      }
    }
  }

}