import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/view/search/search_view.dart';

import '../../../../bloc/search_bloc/search_bloc.dart';
import '../../../../repository/common/search/search_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../widget/textfield/search/search_textfield.dart';
import '../main/main_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (BuildContext context) => SearchCubit(),
    //     child: BlocConsumer<SearchCubit, SearchState>(
    //         listener: (context, state) {},
    //         builder: (context, state) {
    //           final bloc = SearchCubit.get(context);
    // GlobalKey<ScaffoldState> scaffold = GlobalKey();
    return BlocProvider(
      create: (context) => SearchBloc(SearchRepository()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: transparent,
          elevation: 0,
          leading: IconButton(
            icon:const Icon(Icons.arrow_back_outlined,color: secColor,size: 35),
            onPressed: (){
              Get.to(() => const MainScreen());
            },
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 15),
            _SearchBar(),
            // SearchTextfield(
            //   focus: false,
            //   controller: bloc.search,
            //   onChanged: (value) => bloc.getSearchedItems(value),
            // ),
            const SizedBox(height: 10),
            const SearchView(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  SearchBloc? _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchTextfield(
      controller: _textController,
      focus: true,
      onChanged: (text) {
        _searchBloc!.add(
          TextChanged(text: text),
        );
      },
    );
  }
}
