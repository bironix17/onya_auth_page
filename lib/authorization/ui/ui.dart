import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/event.dart';
import 'package:flutter_authorization/authorization/bloc/state.dart';
import 'package:flutter_authorization/authorization/ui/tabs/sign_in.dart';
import 'package:flutter_authorization/authorization/ui/tabs/sign_up.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authorization extends StatefulWidget {
  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization>
    with TickerProviderStateMixin {

  ScrollController _scrollController;
  TabController _tabController;

  List<String> tabNames = ["SIGN UP", "SIGN IN"];
  List<String> tabHeaderText = ["Sign up for a free account", "Sign in to your account"];


  static const TextStyle tabStyle = TextStyle(fontSize: 13);
  static const TextStyle tabHeaderStyle = TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: tabNames.length);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double heightOfScreen = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (context) => AuthorizationBloc(),
        child:
            Scaffold(
                body: SingleChildScrollView(
                  child: SizedBox(
                    height: heightOfScreen,
                    child: Column(
                      children: [
                        _buildHeader(context),
                        _buildBody(context)
                      ],
                    ),
                  ),
                )));
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [

          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/authorization_header_image.png",
              fit: BoxFit.fitWidth,
              height: 220,
              width: double.infinity,
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            alignment: Alignment.topCenter,
            height: 35,
            child: TabBar(
              tabs: tabNames.map((e) => Tab(child: Text(e, style: tabStyle),)).toList(),
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.white,
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.label,
               labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical:0),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: TabBarView(
                physics : NeverScrollableScrollPhysics(),
                controller: _tabController,
                  children: tabHeaderText
                      .map((e) => Container(
                        alignment: Alignment.topCenter,
                        child: Text(e, style: tabHeaderStyle,)))
                        .toList()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<AuthorizationBloc, AuthorizationState>(

        listener: (context, state) {
      if (state is NormalState) {
        if (state.authStatus != null && state.authStatus.isNotEmpty) {
          final snackBar = SnackBar(content: Text(state.authStatus));
          Scaffold.of(context).showSnackBar(snackBar);
        }
      }

    }, builder: (context, state) {
      return Expanded(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            if (state is LoadingState) ...[
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator())
            ],
            if (state is NormalState) ...[
              SignUp(state.signUpElements, state.signUpElementErrors),
              SignIn(state.signInElements, state.signInElementErrors)
            ],
          ],
        ),
      );
    });
  }
}
