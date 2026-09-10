import 'package:flutter/material.dart';
import '../models/cuidador.dart';

class CuidadorCard extends StatelessWidget {
  final Cuidador cuidador;
  final VoidCallback onTap;

  const CuidadorCard({
    super.key,
    required this.cuidador,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: cuidador.nome,
                child: CircleAvatar(
                  radius: 34,
                  backgroundImage: NetworkImage(cuidador.foto),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cuidador.nome,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202B3C),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Color(0xFFFFB300),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${cuidador.avaliacao}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${cuidador.avaliacoes})',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 17,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${cuidador.distancia.toStringAsFixed(1)} km',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 6,
                      children: cuidador.servicos.take(2).map((servico) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF0FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            servico,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF4267C7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}