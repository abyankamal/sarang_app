import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_app/src/common_widgets/people_loved_card_widget.dart';
import 'package:sarang_app/src/features/likes_you/presentation/bloc/explore_people/explore_people_bloc.dart';
import 'package:sarang_app/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleLovedScreen extends StatefulWidget {
  static const String routeName = '/people-loved';
  const PeopleLovedScreen({super.key});

  @override
  State<PeopleLovedScreen> createState() => _PeopleLovedScreenState();
}

class _PeopleLovedScreenState extends State<PeopleLovedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PeopleLovedBloc>().add(OnEventLOvedEventCalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          'People You\nLoved',
          style: getWhiteTextStyle(
              fontSize: FontSizeManager.f20,
              fontWeight: FontWeightManager.semiBold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: AppSize.s30,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppSize.s50,
          ),
          BlocBuilder<PeopleLovedBloc, PeopleLovedState>(
            builder: (context, state) {
              if(state is PeopleLovedLoading){
                return Center(child: CircularProgressIndicator());
              }
              if(state is PeopleLovedLoaded){
                final users = state.userMatch;
                return users.isEmpty ? 
                Center(
                  child: Text(
                    'No Data User Available',
                    style: getWhiteTextStyle(),
                  ),
                ): Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return PeopleLovedCardWidget(
                      user: users[index],
                    );
                  },
                  itemCount: users.length,
                ),
              );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}