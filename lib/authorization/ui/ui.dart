import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/authorization/bloc/bloc.dart';
import 'package:flutter_authorization/authorization/bloc/state.dart';
import 'package:flutter_authorization/authorization/ui/tabs/sign_in.dart';
import 'package:flutter_authorization/authorization/ui/tabs/sign_up.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/enums.dart';
import 'package:flutter_authorization/resources/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthorizationPage extends StatefulWidget {
  static const headerAssetPath = "assets/images/authorization_header_image.png";
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage>
    with TickerProviderStateMixin {

  TabController _tabController;

  static const Map<AuthTab, String> _tabNames = {
    AuthTab.SignUp: "SIGN UP",
    AuthTab.SignIn: "SIGN IN"
  };
  static const Map<AuthTab, String> _tabHeaderText = {
    AuthTab.SignUp: "Sign up for a free account",
    AuthTab.SignIn: "Sign in to your account"
  };

  final Map<AuthTab, Widget> _tabWidgets = {
    AuthTab.SignUp: SignUp(),
    AuthTab.SignIn: SignIn()
  };

  int _tabIndex = AuthTab.SignUp.index;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabNames.length);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthorizationBloc(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [_buildHeader(context), _buildBody(context)],
            ),
          ),
        ));
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AuthorizationPage.headerAssetPath,
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
              tabs: AuthTab.values
                  .map((e) => Tab(
                      child: Text(_tabNames[e], style: TextStyles.tabStyle)))
                  .toList(),
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.white,
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Text(_tabHeaderText[AuthTab.values[_tabIndex]],
                  style: TextStyles.tabHeaderStyle),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return
        BlocListener<AuthorizationBloc, AuthorizationState>(
          listener: (context, state) {
            if (state is NormalState) {
              if (state?.authStatus.isNotEmpty ?? false) {
                final snackBar = SnackBar(content: Text(state.authStatus));
                Scaffold.of(context).showSnackBar(snackBar);
              }
            }
          },
          child: _tabWidgets[AuthTab.values[_tabIndex]],
    );
  }
}
