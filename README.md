# Visão Artificial - Aplicativo Mobile 

> Este repositório faz parte do ecossistema **Visão Artificial**. Para entender a arquitetura distribuída completa, consulte a [API Central (Nuvem)](https://github.com/Thurzinfs/vision-artificial-cloud).

## Sobre, Motivo e Objetivo

### O Motivo
Pessoas com deficiência visual enfrentam barreiras diárias de navegação. Soluções tradicionais muitas vezes sofrem com alta latência ou feedback sonoro repetitivo e confuso.

### A Solução (O App)
O aplicativo **Visão Artificial** atua como a ponta final de acessibilidade do ecossistema. Ele se conecta via WebSocket à API Central (Nuvem) para consumir os resultados processados pela IA. 

Rodando em segundo plano (`flutter_background`), o app traduz esses dados em **síntese de voz em português do Brasil (`flutter_tts`)**. O grande diferencial é a sua **lógica de supressão de duplicidade**, que evita falas repetitivas e garante que o usuário cego receba apenas orientações novas, limpas e essenciais para a sua autonomia espacial.

---

## Tecnologias 

| Tecnologia | Finalidade |
| --- | --- |
| Flutter e Dart | Desenvolvimento do aplicativo multiplataforma. |
| `flutter_bloc` | Gerenciamento de estado com Cubit. |
| `web_socket_channel` | Recebimento de detecções via WebSocket. |
| `flutter_tts` | Síntese de voz em português do Brasil. |
| `flutter_background` | Execução do monitoramento em segundo plano. |
| `get_it` | Injeção e gerenciamento de dependências. |
| `flutter_dotenv` | Carregamento de configurações, incluindo `API_URL`, via `.env`. |
| `uuid` | Geração de identificadores. |

---

## Estrutura

```text
lib/
├── data
│   ├── models
│   │   └── detection_models.dart
│   ├── repositorys
│   │   ├── detection_repository.dart
│   │   └── speech_repository.dart
│   └── sources
│       ├── background_service.dart
│       ├── detection_data_source.dart
│       └── speech_data_source.dart
├── domain
│   ├── entities
│   │   └── detection.dart
│   ├── repositories
│   │   ├── detection_repository.dart
│   │   └── speech_repository.dart
│   └── use_cases
│       └── detection_use_cases.dart
├── injection_container.dart
├── main.dart
└── presentation
    └── cubit
        └── detection_cubit.dart                        
```

---

## Arquitetura e decisão de design

O aplicativo segue Clean Architecture, separando apresentação, regras de negócio e integrações externas. Essa divisão mantém as responsabilidades claras e facilita a manutenção e a evolução dos serviços; o `GetIt` centraliza a injeção de dependências.

---

## Roadmap

**Fase 1 · Núcleo e Conectividade**
- [x] Conexão estável via WebSocket para consumo dos dados da nuvem
- [x] Execução contínua em segundo plano (`flutter_background`)
- [x] Arquitetura limpa estruturada com Clean Architecture e GetIt

**Fase 2 · Acessibilidade e Experiência do Usuário**
- [x] Integração com síntese de voz (`flutter_tts`) em português do Brasil
- [x] Filtragem de detecções por nível de confiança (> 0.4)
- [x] Lógica de supressão de duplicidade (evita falas repetitivas e poluição sonora)

**Fase 3 · Refinamento e Performance**
- [ ] Processamento otimizado de múltiplas detecções simultâneas
- [ ] Ajuste dinâmico de sensibilidade e volume de voz na interface
- [ ] Tratamento avançado de reconexão automática em quedas de rede/WebSocket

**Futuro**
- [ ] Feedback tátil (vibração direcional) complementando o áudio
- [ ] Histórico local inteligente de alertas recentes
- [ ] Otimização profunda para baixo consumo de bateria em uso prolongado

---

## Contato

- **Autor** — Arthur França Silva
- **E-mail** — arthurfranca.dev@gmail.com
- **GitHub** — [@Thurzinfs](https://github.com/Thurzinfs)

---

<div align="center">
  Desenvolvido com ❤️ por <a href="https://github.com/Thurzinfs">Arthur França Silva</a>
</div>