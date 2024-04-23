import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/features/home/data/datasource/network/charter_datasource.dart';
import 'package:rick_morty_app/features/home/data/repository_imp/charter_repository_impl.dart';
import 'package:rick_morty_app/features/home/ui/blocs/charter_bloc/charter_bloc.dart';

import 'package:rick_morty_app/features/home/ui/widgets/characters_widget.dart';
import 'package:rick_morty_app/features/home/ui/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'homes_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    return BlocProvider(
      create: (context) => CharterBloc(
        charterRepository: CharterRepositoryImpl(
          charterDatasource: CharterDatasource(),
        ),
      )
        ..init()
        ..add(const FetchCharters()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Color(0XFF292929),
          body: Padding(
            padding:
                const EdgeInsets.fromLTRB(20, kToolbarHeight * 1.3, 30, 10),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Search for a content",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SearchWidget(
                    focusNode: focusNode,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Characters",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CharactersWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
