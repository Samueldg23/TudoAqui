//criar um card pra mostrar dados de um serviço

import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String nome;
  final String descricao;
  final String imagemUrl;
  final VoidCallback onTap;

  const ServiceCard({super.key, 
    required this.nome,
    required this.descricao,
    required this.imagemUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imagemUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                nome,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                descricao,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*pode usar assim:
ServiceCard(
  nome: "Encanador",
  descricao: "Serviços de encanamento residencial e comercial.",
  imagemUrl: "url da imagem",
  onTap: () {
    print("Card de encanador pressionado!");
  },
);
*/