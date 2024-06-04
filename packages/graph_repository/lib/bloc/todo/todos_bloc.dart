import 'package:graph_repository/models/graphql/graphql_api.dart';
import 'package:graphql_flutter_bloc/graphql_flutter_bloc.dart';
import 'package:graphql/client.dart';

class ToDosBloc extends QueryBloc<GetToDos$Query> {
  ToDosBloc({required GraphQLClient client, WatchQueryOptions? options})
      : super(
          client: client,
          options: options ??
              WatchQueryOptions(
                document: GetToDosQuery().document,
                //pollInterval: Duration(seconds: 10),
              ),
        );

  @override
  GetToDos$Query parseData(Map<String, dynamic>? data) {
    return GetToDos$Query.fromJson(data ?? {});
  }
}
