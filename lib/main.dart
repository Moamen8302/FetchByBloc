import 'package:fetch_data_by_bloc/Storage/postData.dart';
import 'package:fetch_data_by_bloc/blocs/post/postBloc.dart';
import 'package:fetch_data_by_bloc/blocs/post/postEvents.dart';
import 'package:fetch_data_by_bloc/blocs/post/postState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => PostBloc(InitialState(), PostData()),
        child: PostUi(),
      ),
    )
  );
}

class PostUi extends StatefulWidget {
  @override
  _PostUiState createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  PostBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<PostBloc>(context);
    bloc.add(OpenEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if(state is InitialState) {
              return CircularProgressIndicator();
            } else if (state is LoadingState) {
              return CircularProgressIndicator();
            } else if (state is FetchSuccess) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  );
                },
              );
            } else if(state is ErrorState) {
              return ErrorWidget(state.message.toString());
            }
          },
        ),
      ),
    );
  }
}
