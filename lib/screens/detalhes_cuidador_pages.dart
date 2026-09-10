import 'package:flutter/material.dart';
import '../models/cuidador.dart';

class DetalhesCuidadorPage extends StatelessWidget {
  final Cuidador cuidador;

  const DetalhesCuidadorPage({
    super.key,
    required this.cuidador,
  });

  void mostrarCancelamento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancelar agendamento?'),
          content: const Text(
            'Tem certeza de que deseja cancelar este agendamento?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text('Sim, cancelar'),
            ),
          ],
        );
      },
    );
  }

  void mostrarTipoServico(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Tipo de serviço'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Passeio');
              },
              child: const ListTile(
                leading: Icon(Icons.directions_walk),
                title: Text('Passeio'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Hospedagem');
              },
              child: const ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Hospedagem'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Banho e tosa');
              },
              child: const ListTile(
                leading: Icon(Icons.content_cut),
                title: Text('Banho e tosa'),
              ),
            ),
          ],
        );
      },
    );
  }

  void mostrarMaisOpcoes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Mais opções',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                ListTile(
                  leading: const Icon(Icons.share_outlined),
                  title: const Text('Compartilhar perfil'),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Perfil pronto para compartilhar.',
                        ),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(
                    Icons.flag_outlined,
                    color: Colors.red,
                  ),
                  title: const Text('Denunciar'),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Obrigado. Sua denúncia será analisada.',
                        ),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.block_outlined),
                  title: const Text('Bloquear cuidador'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Perfil do cuidador',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              mostrarMaisOpcoes(context);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                20,
                30,
                20,
                25,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF5B8CFF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Hero(
                    tag: cuidador.nome,
                    child: CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        cuidador.foto,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    cuidador.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${cuidador.avaliacao}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(${cuidador.avaliacoes} avaliações)',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${cuidador.distancia.toStringAsFixed(1)} km de você',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sobre o cuidador',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF202B3C),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    cuidador.descricao,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Serviços disponíveis',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF202B3C),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: cuidador.servicos.map((servico) {
                      return Chip(
                        avatar: const Icon(
                          Icons.pets,
                          size: 17,
                        ),
                        label: Text(servico),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.payments_outlined,
                          color: Color(0xFF5B8CFF),
                          size: 30,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'A partir de',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'R\$ ${cuidador.preco.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: () {
                        mostrarTipoServico(context);
                      },
                      icon: const Icon(
                        Icons.pets,
                      ),
                      label: const Text(
                        'Tipo de serviço',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        mostrarCancelamento(context);
                      },
                      icon: const Icon(
                        Icons.event_busy,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Cancelar agendamento',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: TextButton.icon(
                      onPressed: () {
                        mostrarMaisOpcoes(context);
                      },
                      icon: const Icon(Icons.more_horiz),
                      label: const Text(
                        'Mais opções',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}