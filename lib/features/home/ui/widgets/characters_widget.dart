import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:rick_morty_app/features/details/ui/screen/details_screen.dart';
import 'package:rick_morty_app/features/home/ui/blocs/charter_bloc/charter_bloc.dart';

class CharactersWidget extends StatelessWidget {
  const CharactersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final charterBloc = context.read<CharterBloc>();
    return BlocBuilder<CharterBloc, CharterState>(
      builder: (context, state) {
        if (state.status == CharterStatus.loading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.status == CharterStatus.succes) {
          return Expanded(
            child: LazyLoadScrollView(
              onEndOfPage: () {
                charterBloc.add(const FetchCharters());
              },
              scrollOffset: 60,
              child: RefreshIndicator(
                onRefresh: () {
                  charterBloc.add(const RefreshEvent(true));
                  return Future.value();
                },
                child: GridView.builder(
                  //controller: charterBloc.scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: state.charters.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 200),
                  itemBuilder: (context, index) {
                    final item = state.charters[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        context.push('/${DetailScreen.name}/${item.id}');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Flexible(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                item.specie,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
