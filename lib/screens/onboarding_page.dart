import 'package:agenclean_project/screens/login_screen.dart';
import 'package:agenclean_project/constants.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(pages: [
        OnboardingPageModel(
          title: 'Segurança, conforto e praticidade',
          description:
              'Como prestadora, encontre clientes mais próximos da sua região!',
          imageUrl:
              'https://lh3.googleusercontent.com/pw/ADCreHewUTl42tBAC8Bzw2FvxgUtooUoIYUvt_qzijoPY2GnQY5hLAUnnGwJccVsrbhsJg9UDevBmU6TzGvZh63llpfsHpaH6jk0C20pRyU3Meygq3PZqanuJFdmQQn0znTpuzs4RbahcoMgNrlcS3MmD7JzSoOjjuLe0KnTbIW-tRDnBlvvRP4OrKxMrx3E9n0pcofChAYa-hfNc_yQp-ClZQDPt6ARoKYMKFMFhALyCK2A8yT6J9bxrK24VGrUdX-cdPlQvM3b23_a2RovcIxzZJr-P3eUad0IBmek-5t_EVxdGOGfh5tHJeqj11TO-D9jSX8jOEZloKGmKwPOwbao6MyUCgmzYL6p-OXegTeNu4TrEELkL3nPuLHTs8vX9-8ut4ErhohhUnQFg6A2OxukfvT6dHqjBvEMWk0bk7a6oIcedpNF1cjRZ_2dqGo6KmxGINiZ2HylMzzPgjYP4qU-9iM3vtEUacc6v2AiMmpPIVR8SA4vEY8TAETZSgRn2mqBxiZl7AyWFFqGZSIjjEwDBoDbX_zMkK7XSA3LhDHnTL28JROB1rdz-bbyVbnXda4VSTJ7rCYEcVhsYJxUWJMwMDlTSXrMF-oCAybHTISHzjClaggokA8K9yvCevQULFr_JXRLZAu5Ir5FMESwwyZUJ4NAadBAijsFH7J5uq1XxLJ7zREjrMGFxOKOu1MQhtLpDo_Fz7epuG2_QfxElZ9BaoCRq-cejn42VavRuKZ-4mI0WP8AYybT6nHEi1ytFnGurABPUBUdCsw5g6M5Um6CI3gjlM0pkojHu9uyDmzjEXgFr990y0_TKsbv9aCjAFcnrYLxlOURGfBBfQLT_VPbSo1CS5CxA0L19sFFYnmgURdx0-RjDTVQ5vBLTcmW8OrxOVA2KK-Jm39b7AenmdW_pf8m3ET2959FDN12fko8DJo=w400-h300-s-no?authuser=1',
          bgColor: azulPrimario,
        ),
        OnboardingPageModel(
          title: 'Não sofra com calote ou má atendimento',
          description: 'Na AgenClean, ambos os lados recebem avaliações.',
          imageUrl: 'https://lh3.googleusercontent.com/pw/ADCreHd2HHkNlDnkoX5raqtWGJjvXuiUlYY9ruoL1ens4GF0NDFOTyabkfWo4lkNx7_pysVj8jafH_0mTWdUE8PocmaM2LrT9UJoKds8Qo3ay7rWTOeANDkquRAuLPW2hs6Fj69hjJwR4hU-Er69Ftpln4q5gcUangmaImn--J5lts-CgidtlsPJbL0JFTUNP64OKla2mXiHeJkwJV4LDmnBjM3Ufb7tWYnZC8Lt7S0zf44mSt__itH6pnivsjCSjxveAUxrBUX00nHM_8r7mTkV1cYJQMhcbLy31DBguoBanv44gxYxEeG8gsVnPQKclYeLJyIRqj5M7Q43m00k6HUOCn6W4UoymNQ3ErES2oY8R0314D01q2JokYQYvOssYpL5P8SWZIzwxH4ufXPniwUgZ-0OCdfhMRGgm0gUuzG0PsQ0Q7Fal5D1RtATXaxtsvlP3X40-qY7cqCFdACs_vJ9F4JxS5V9ClrB2-KNf3s08IENkDOBnPmlgy-K2CRV_rmF61Gnl8V6xDlef_euk0EAfVXTUwCEhjkm0FM4mEcX8O-M70DcNWnvENvz2tuOlBuYlBGhZoiFk5NKyy6EkR3S77LtTdEWjjmpE5yIeLVHVzAEwZ6aJwUJDy0qgHSHz65js5lmnTezTl97c-jy86viZyNKw5gY4u8N-Q-YHlHBLaZK_M-PIMpo5n4APhx6uHZPGT81_mbqhg6h7eH9Hgxk37jJb96WP4ulyw7m35Sz3qF8lWMbOgHtrUew8HzxUk5Su34uYZ0jpMfOlc0AdfLXg8gX4TOEbCmQ7E-rXGfz4J4wT0_kuubToz1PIkn-BaX3r2PxlYjlIoF3rvwI1tHXVursUI0dDr4Tliq7XKqrJ2yPyMmAllQ0j5D_bCgl89PbaxJj8q6jzmHb2BTvM2g4SnnqwwzOAvOVmE7rthnTZjU=w360-h360-s-no?authuser=1',
          bgColor: azulPrimario,
        ),
        OnboardingPageModel(
          title: 'Prestadores na sua região, em um só App',
          description:
              'Procure por diaristas, babás e muito mais com as melhores avaliações',
          imageUrl: 'https://lh3.googleusercontent.com/pw/ADCreHdStqEbfwlC-8QID3cm5e-vP68INkduOOy7FtKFuHxviQyyo78kVVyY5Rvq1rhlphsTv9CHRBXiHSRv9fUSt5U9pk8SvYv8FxW-XYuQxkNUdTH5dbjUgP0qCNCH5WddxCc2PTcWvBqESaHyc_16W_Tyy6AHu5l6Sabdnrq6oBANwl1ukgxb2MEsGECp7cApqNM7lp8mG95qxHFk0djLUO6AfCZ3b6-mVzlUFnheeq5OzyfLh73QzEfKjCJr5Xiz5iTVSfeVZdeiJQD15d41ppBMZS9OW9V31RQDO9AceQwTh9pD4NJMX3pv20bX93Cn82wCTz45bixMpihuOSy8-MRvXb4ISs5AEuMsemSeUIlfRVC3Sv97yYBQusVYh1wkEaywMhph6CnWX8rFPJBcPFHoOzsQ22C3SUmxxJX_rGfgjeU2pse9zIe1UDz61uaWz0W0p1Y77dt1spIqSmYrNygVTVc2pXqXTQRNvey5cgz50L0ehi12iSw4j5CIi2NroAe-wCNCLjTKLN2hoaAWQO87gO8IhYire0n-7fne5-ISK_euxugK32OEZ-RhwA75UWqc0ZuXuEDHQwc9WOpekn8-YVy08Z-Avv19HH8laC41eOWafyrcL__qYtm2mVPoUKM54wYkgw3lHfKXf0zsjOEY94L3a9rcCKFdpP3FZLjDR6WJ9kwWARX6tsDlfVz8HUKTYLD3EV73Ym5IuuJ2pQ6SuHpbDvhiQwJ4MLTjb5NJgUypYXI7YtXPy4BI074DPT4Tm1PquyNqIq6MesFwF6IO0ZXBcHhIVarSgINZCm0LOn1Dwj9cZKbyCYOiaWxfbgZTgh-um5CRtEUt9N77etBy6F5khCIskGHiS2J8DS0VHbEXw1upnSNJK-9Kxpqo5To_PVUwTu_BxUKriFpse3pVwMWCatZ-q6-Zrj2NQME=w500-h500-s-no?authuser=1',
          bgColor: laranjaPrimario,
        ),
        OnboardingPageModel(
          title: 'Focado em quem está mais perto de você',
          description:
              'Priorizamos quem está mais perto de você, para mais praticidade.',
          imageUrl: 'https://lh3.googleusercontent.com/pw/ADCreHf_jxgVtGAAaSzSWsOb7c1rbPgmINWsNHBKn6GCLQGZZVfi30H8g8VLBnHVgMc3EybbXpVOUIrX-WdcuR0KIeGZdI8KY5rZatUqKoeLabCVycHUj13jrQFYIb71c-qXE_PzsRR1A5Sw1NT5CvsANKvuS72gecgAj2VsX7HYWLHuj8T0tqDw8wdEHzYMdIl-HPR6xDa2Igo7q78sMySsKw0IkFaPfAHc91TqlGtk9HGrahPa09Alb8Tg5SNh6wOHQKctZQUGyms0SPT7XDox8bJvwGakOcrMozK8jpIYd2o-S06DCSmSFYrHnZVO5i4sAryfcdI1upKpbQOVM290qhh-tDpvKr3KKkh70l-UDtJ3IhnWCYdO1h6TZbvtbUmqIWI_44xU-ypIfI_t-k040_XoMlfN2H8Ba7RlBakPQMDbvcKH7RMrCdYCPcs9-y4kHMY4KKM-FWz4K36n6TDvPaYryuVBzLdQIODhIDQCM97RsinYY9gUYziQRr7A47ZDAVY7fbgiSHoBxhvH8Adg64M3gqulEBIJ-wtMQBCLyYEqR6d78XO6bpEXr4tw_YZj1A6DQUsfJRZeAZn_ZHiF6KOTFyq0VyEY0swlW1Eqd9B9pLLuPDLasv4dY-hKpvHnEyo9sgSM-SP4zTUMiJWJCskce252yu35gHZArradTO-bfCHUgCoFnEC1Ulpx_hB8CvrKQhOcystKNV0CotYKM6qK18DCtDM00Xu0WJ9LnxyWhXO___BRYTTWGzgJX_R2IGDDiOCAiIVzcANg0ZlYe1-EKGLyCQEER_dX5rW0jfJy3018hHOkiXbyL8S5ytZx0WVb79nY0fv30F2WALjMt3Usl1ZYZp0v9Jfq-Dfqqo_arsWehfqkPFO48UQbeDDe2qWL-hmnu8VvQXKgmB7UMlOqioBcfZw96MdxiALo0Ks=w661-h377-s-no?authuser=1',
          bgColor: laranjaPrimario,
        ),
      ]),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter({
    Key? key,
    required this.pages,
    this.onSkip,
    this.onFinish,
  }) : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              item.imageUrl,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: item.textColor,
                                        )),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: item.textColor,
                                        )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages.indexOf(item)
                              ? 30
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        // Navega para a tela de login substituindo a rota atual
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Skip"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          // Se estiver na última página, navegue para a tela de login
                          _pageController.animateToPage(
                            _currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic,
                          );
                          Future.delayed(
                            const Duration(milliseconds: 500),
                            () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          );
                        } else {
                          // Caso contrário, avance para a próxima página
                          _pageController.animateToPage(
                            _currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic,
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1
                                ? "Finish"
                                : "Next",
                          ),
                          const SizedBox(width: 8),
                          Icon(_currentPage == widget.pages.length - 1
                              ? Icons.done
                              : Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;

  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white});
}
