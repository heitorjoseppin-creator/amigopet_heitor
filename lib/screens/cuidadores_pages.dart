import 'package:flutter/material.dart';

import '../models/cuidador.dart';
import '../widgets/cuidador_card.dart';
import 'detalhes_cuidador_pages.dart';

class CuidadoresPage extends StatefulWidget {
  const CuidadoresPage({super.key});

  @override
  State<CuidadoresPage> createState() => _CuidadoresPageState();
}

class _CuidadoresPageState extends State<CuidadoresPage> {
  final List<Cuidador> cuidadores = [
    const Cuidador(
      nome: 'Mariana Silva',
      foto: 'https://i.pravatar.cc/150?img=47',
      cidade: 'São Paulo',
      avaliacao: 4.9,
      avaliacoes: 128,
      distancia: 0.8,
      descricao:
      'Apaixonada por animais e com experiência em cães e gatos.',
      servicos: ['Passeio', 'Hospedagem'],
      preco: 35,
    ),
    const Cuidador(
      nome: 'Lucas Oliveira',
      foto: 'https://i.pravatar.cc/150?img=12',
      cidade: 'São Paulo',
      avaliacao: 4.8,
      avaliacoes: 96,
      distancia: 1.2,
      descricao:
      'Cuidador dedicado, responsável e com bastante experiência.',
      servicos: ['Passeio', 'Banho e tosa'],
      preco: 30,
    ),
    const Cuidador(
      nome: 'Ana Costa',
      foto: 'https://i.pravatar.cc/150?img=44',
      cidade: 'São Paulo',
      avaliacao: 4.7,
      avaliacoes: 74,
      distancia: 1.7,
      descricao:
      'Tenho muito carinho por pets e ofereço cuidados personalizados.',
      servicos: ['Hospedagem', 'Passeio'],
      preco: 40,
    ),
    const Cuidador(
      nome: 'Pedro Santos',
      foto: 'https://i.pravatar.cc/150?img=33',
      cidade: 'São Paulo',
      avaliacao: 4.9,
      avaliacoes: 151,
      distancia: 2.1,
      descricao:
      'Experiência com cães de pequeno, médio e grande porte.',
      servicos: ['Passeio', 'Hospedagem'],
      preco: 45,
    ),
    const Cuidador(
      nome: 'Camila Souza',
      foto: 'https://i.pravatar.cc/150?img=32',
      cidade: 'São Paulo',
      avaliacao: 4.6,
      avaliacoes: 62,
      distancia: 2.8,
      descricao:
      'Cuido do seu pet como se fosse parte da minha família.',
      servicos: ['Banho e tosa', 'Passeio'],
      preco: 32,
    ),
  ];

  void abrirDetalhes(Cuidador cuidador) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetalhesCuidadorPage(
          cuidador: cuidador,
        ),
      ),
    );
  }

  void ordenar(String opcao) {
    setState(() {
      if (opcao == 'proximos') {
        cuidadores.sort(
              (a, b) => a.distancia.compareTo(b.distancia),
        );
      } else if (opcao == 'avaliacao') {
        cuidadores.sort(
              (a, b) => b.avaliacao.compareTo(a.avaliacao),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AmigoPet',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cuidadores próximos',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.tune),
            onSelected: ordenar,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'proximos',
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 10),
                    Text('Mais próximos'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'avaliacao',
                child: Row(
                  children: [
                    Icon(Icons.star_outline),
                    SizedBox(width: 10),
                    Text('Melhor avaliados'),
                  ],
                ),
              ),
            ],
          ),

          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF5B8CFF),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Color(0xFF5B8CFF),
                ),
              ),
              accountName: const Text(
                'Olá, Tutor!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                'Encontre o melhor cuidado para seu pet',
              ),
            ),

            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Cuidadores'),
              selected: true,
              selectedColor: const Color(0xFF5B8CFF),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: const Text('Meus agendamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Ajuda'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Encontre um cuidador',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202B3C),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Cuidadores de confiança perto de você',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por nome ou serviço',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              itemCount: cuidadores.length,
              itemBuilder: (context, index) {
                final cuidador = cuidadores[index];

                return CuidadorCard(
                  cuidador: cuidador,
                  onTap: () => abrirDetalhes(cuidador),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}