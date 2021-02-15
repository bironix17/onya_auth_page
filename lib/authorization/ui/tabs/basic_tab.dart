import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicTab extends StatelessWidget {

  final Function(NormalState) onNormalState;
  final Function(LoadingState) onLoadingState;

  BasicTab({@required this.onNormalState, @required this.onLoadingState});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state){
        if (state is NormalState) return onNormalState(state);
        if (state is LoadingState) return onLoadingState(state);
        return Text("Необработанная ошибка");
      }
    );
  }
}
