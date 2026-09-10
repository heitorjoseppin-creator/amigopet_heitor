class Cuidador {
  final String nome;
  final String foto;
  final String cidade;
  final double avaliacao;
  final int avaliacoes;
  final double distancia;
  final String descricao;
  final List<String> servicos;
  final double preco;

  const Cuidador({
    required this.nome,
    required this.foto,
    required this.cidade,
    required this.avaliacao,
    required this.avaliacoes,
    required this.distancia,
    required this.descricao,
    required this.servicos,
    required this.preco,
  });
}