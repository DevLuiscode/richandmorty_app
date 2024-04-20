import 'package:flutter/material.dart';
import 'package:rick_morty_app/features/details/ui/widgets/description_widget.dart';
import 'package:rick_morty_app/features/details/ui/widgets/header_box_widget.dart';
import 'package:rick_morty_app/shared/widgets/outline_button_widget.dart';

class DetailScreen extends StatelessWidget {
  static const name = "detail_screen";
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFF292929),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: size.height * 0.4,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Placeholder(),
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
            child: Expanded(
              child: SizedBox(
                height: size.height * 0.6 - kToolbarHeight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const HeaderBoxWidget(),
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
            ),
          )
        ],
      ),
    );
  }
}
