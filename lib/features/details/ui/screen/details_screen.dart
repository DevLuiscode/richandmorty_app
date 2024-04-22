import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/features/details/data/datasources/network/detail_datasource.dart';
import 'package:rick_morty_app/features/details/data/repository/detail_repository_impl.dart';
import 'package:rick_morty_app/features/details/ui/blocs/detail_bloc/detail_bloc.dart';
import 'package:rick_morty_app/features/details/ui/widgets/description_widget.dart';
import 'package:rick_morty_app/features/details/ui/widgets/header_box_widget.dart';
import 'package:rick_morty_app/shared/widgets/outline_button_widget.dart';

class DetailScreen extends StatelessWidget {
  static const name = "detail_screen";
  const DetailScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DetailBloc(
        detailRepository: DetailRepositoryImpl(
          detailDatasource: DetailDatasource(),
        ),
      )..add(FetchIdCharterEnvent(id: int.parse(id))),
      child: Scaffold(
        backgroundColor: const Color(0XFF292929),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state.detailStatus == DetailStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.detailStatus == DetailStatus.succes) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    collapsedHeight: size.height * 0.4,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          Image.network(
                            state.byCharterEntity.image,
                            scale: 0.5,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0XFF1A1A1D),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: size.height * 0.6 - kToolbarHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            HeaderBoxWidget(
                              name: state.byCharterEntity.name,
                              gender: state.byCharterEntity.gender,
                              state: state.byCharterEntity.status,
                            ),
                            const SizedBox(height: 50),
                            const DescriptionWidget(),
                            const Spacer(),
                            OutlineButtonWidget(
                              name: "Watch now",
                              onSelected: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            if (state.detailStatus == DetailStatus.error) {
              return const Center(
                child: Text("error"),
              );
            } else {
              return const Center(
                child: Text("Bienvenido"),
              );
            }
          },
        ),
      ),
    );
  }
}
