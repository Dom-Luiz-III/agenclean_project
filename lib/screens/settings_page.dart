import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaConfiguracoes extends StatefulWidget {
  const PaginaConfiguracoes({Key? key}) : super(key: key);

  @override
  State<PaginaConfiguracoes> createState() => _EstadoPaginaConfiguracoes();
}

class _EstadoPaginaConfiguracoes extends State<PaginaConfiguracoes> {
  bool _modoEscuro = true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _modoEscuro ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SecaoUnica(
                  titulo: "Geral",
                  children: [
                    _ItemListaCustomizado(
                      titulo: "Modo Escuro",
                      icone: Icons.dark_mode_outlined,
                      elementoTrailing: Switch(
                        value: _modoEscuro,
                        onChanged: (valor) {
                          setState(() {
                            _modoEscuro = valor;
                          });
                        },
                      ),
                    ),
                    const _ItemListaCustomizado(
                      titulo: "Notificações",
                      icone: Icons.notifications_none_rounded,
                    ),
                    const _ItemListaCustomizado(
                      titulo: "Status de Segurança",
                      icone: CupertinoIcons.lock_shield,
                    ),
                  ],
                ),
                const Divider(),
                const _SecaoUnica(
                  titulo: "Organização",
                  children: [
                    _ItemListaCustomizado(
                      titulo: "Perfil",
                      icone: Icons.person_outline_rounded,
                    ),
                    _ItemListaCustomizado(
                      titulo: "Fale Conosco",
                      icone: Icons.message_outlined,
                    ),
                    _ItemListaCustomizado(
                      titulo: "Chamadas",
                      icone: Icons.phone_outlined,
                    ),
                    _ItemListaCustomizado(
                      titulo: "Pessoas",
                      icone: Icons.contacts_outlined,
                    ),
                    _ItemListaCustomizado(
                      titulo: "Histórico de Contatos",
                      icone: Icons.calendar_today_rounded,
                    ),
                  ],
                ),
                const Divider(),
                const _SecaoUnica(
                  children: [
                    _ItemListaCustomizado(
                      titulo: "Ajuda e Feedback",
                      icone: Icons.help_outline_rounded,
                    ),
                    _ItemListaCustomizado(
                      titulo: "Sobre",
                      icone: Icons.info_outline_rounded,
                    ),
                    _ItemListaCustomizado(
                      titulo: "Sair",
                      icone: Icons.exit_to_app_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemListaCustomizado extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final Widget? elementoTrailing;
  const _ItemListaCustomizado({
    Key? key,
    required this.titulo,
    required this.icone,
    this.elementoTrailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titulo),
      leading: Icon(icone),
      trailing: elementoTrailing,
      onTap: () {},
    );
  }
}

class _SecaoUnica extends StatelessWidget {
  final String? titulo;
  final List<Widget> children;
  const _SecaoUnica({
    Key? key,
    this.titulo,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titulo != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titulo!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
