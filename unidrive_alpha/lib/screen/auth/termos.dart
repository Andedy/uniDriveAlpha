import 'package:flutter/material.dart';
import 'package:unidrive_alpha/screen/auth/signup.dart';
import 'package:unidrive_alpha/widgets/custom_drawer.dart';

import '../home.dart';
import 'login.dart';

class TermosScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: new IconButton(
            padding: EdgeInsets.only(top: 16, left: 16),
            icon: new Icon(
              Icons.arrow_back,
              color: Color(0xFF08AEA4),
              size: 34,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            }),
        elevation: 0,
      ),
      drawer: CustomDrawer(_pageController),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "TERMOS DE USO E PRIVACIDADE ",
                          semanticsLabel: "TERMOS DE USO E PRIVACIDADE ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: <Widget>[
                  Text(
                    "1. ACEITAÇÃO DOS TERMOS E CONDIÇÕES DE USO",
                    textAlign: TextAlign.center,
                    semanticsLabel:
                        "1. ACEITAÇÃO DOS TERMOS E CONDIÇÕES DE USO",
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         Bem-vindo(a) ao aplicativo uniDrive (a “aplicação”). O PRESENTE DOCUMENTO (“TERMOS DE USO E PRIVACIDADE”) estabelece os termos, condições e tratamentos de dados aplicáveis ao uso da aplicação. Por favor, revise os termos de uso cuidadosamente antes de utilizar a aplicação. Ao realizar seu cadastro na aplicação, todos os usuários (“você”, “vocês”, “usuário” ou “usuários”) declaram aceitar os termos e condições contidos no presente documento. Caso VOCÊ NÃO CONCORDE com os termos, condições e tratamentos de dados previstos neste documento, por favor, NÃO USE A APLICAÇÃO. \n"
                    "         Os termos, condições e tratamentos de dados aqui contidos regulamenta a utilização da aplicação, que pertencem à Andrezza Vieira de Andrade (a “responsável”), devidamente inscrita no CPF 023.855.260-85.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "Bem-vindo(a) ao aplicativo uniDrive (a “aplicação”). O PRESENTE DOCUMENTO (“TERMOS DE USO E PRIVACIDADE”) estabelece os termos, condições e tratamentos de dados aplicáveis ao uso da aplicação. Por favor, revise os termos de uso cuidadosamente antes de utilizar a aplicação. Ao realizar seu cadastro na aplicação, todos os usuários (“você”, “vocês”, “usuário” ou “usuários”) declaram aceitar os termos e condições contidos no presente documento. Caso VOCÊ NÃO CONCORDE com os termos, condições e tratamentos de dados previstos neste documento, por favor, NÃO USE A APLICAÇÃO. "
                        "Os termos, condições e tratamentos de dados aqui contidos regulamenta a utilização da aplicação, que pertencem à Andrezza Vieira de Andrade (a “responsável”), devidamente inscrita no CPF 023.855.260-85.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "2. MODIFICAÇÃO DOS TERMOS",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "2. MODIFICAÇÃO DOS TERMOS",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         O presente termo pode ser alterado periodicamente, nesse caso, se forem feitas alterações nos termos, vocês serão notificados através de aviso em destaque na aplicação e/ou envio de um e-mail para o endereço de e-mail utilizado no seus cadastro. Qualquer alteração neste termo será imediatamente efetivada para os novos usuários, caso contrário o período para início de sua vigência será de 30 dias após o envio da notificação.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "O presente termo pode ser alterado periodicamente, nesse caso, se forem feitas alterações nos termos, vocês serão notificados através de aviso em destaque na aplicação e/ou envio de um e-mail para o endereço de e-mail utilizado no seus cadastro. Qualquer alteração neste termo será imediatamente efetivada para os novos usuários, caso contrário o período para início de sua vigência será de 30 dias após o envio da notificação.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "3. UTILIZAÇÃO DA APLICAÇÃO",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "3. UTILIZAÇÃO DA APLICAÇÃO",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         O Usuário reconhece que é responsável por quaisquer informações falsas que possam ser prestadas para a utilização da Aplicação, bem como qualquer conteúdo inserido pelo mesmo na aplicação ou meio que permita a comunicação para fins de uso da aplicação. O Usuário isenta a aplicação de qualquer responsabilidade quanto à veracidade dos dados pessoais fornecidos por ele quando do uso da Aplicação, bem como por qualquer violação a direitos de terceiros, ocorrida através da aplicação decorrentes de suas declarações.\n         O Usuário reconhece, ainda, que estes Termos, condições e tratamentos de dados aplicáveis ao uso da aplicação devem ser observados e fielmente cumpridos, sob pena de cancelamento de bloqueio de utilização da aplicação e demais medidas cabíveis, caso os mencionados Termos forem violados ou descumpridos.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         O Usuário reconhece que é responsável por quaisquer informações falsas que possam ser prestadas para a utilização da Aplicação, bem como qualquer conteúdo inserido pelo mesmo na aplicação ou meio que permita a comunicação para fins de uso da aplicação. O Usuário isenta a aplicação de qualquer responsabilidade quanto à veracidade dos dados pessoais fornecidos por ele quando do uso da Aplicação, bem como por qualquer violação a direitos de terceiros, ocorrida através da aplicação decorrentes de suas declarações.\n         O Usuário reconhece, ainda, que estes Termos, condições e tratamentos de dados aplicáveis ao uso da aplicação devem ser observados e fielmente cumpridos, sob pena de cancelamento de bloqueio de utilização da aplicação e demais medidas cabíveis, caso os mencionados Termos forem violados ou descumpridos.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "4. REGISTRO E DADOS PESSOAIS",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "4. REGISTRO E DADOS PESSOAIS",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         É dever do Usuário manter atualizados os dados pessoais fornecidos quando da utilização da Aplicação. "
                    "\n         A responsável pela Aplicação pode cancelar qualquer registro do Usuário, a qualquer momento e sem prévio aviso, assim que tiver conhecimento, e a seu exclusivo critério, se o Usuário descumprir, intencionalmente ou não, estes Termos e Condições de Uso, ou violar leis e regulamentos federais, estaduais e/ou municipais, ou violar os princípios legais, a moral e os bons costumes."
                    "\n         Os Usuários que tiverem seus registros cancelados não poderão mais utilizar a Aplicação.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         É dever do Usuário manter atualizados os dados pessoais fornecidos quando da utilização da Aplicação. "
                        "\n         A responsável pela Aplicação pode cancelar qualquer registro do Usuário, a qualquer momento e sem prévio aviso, assim que tiver conhecimento, e a seu exclusivo critério, se o Usuário descumprir, intencionalmente ou não, estes Termos e Condições de Uso, ou violar leis e regulamentos federais, estaduais e/ou municipais, ou violar os princípios legais, a moral e os bons costumes."
                        "\n         Os Usuários que tiverem seus registros cancelados não poderão mais utilizar a Aplicação.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "5. REGRAS DE CONDUTA DO USUÁRIO",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "5. REGRAS DE CONDUTA DO USUÁRIO",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         O Usuário se compromete que, ao usar a Aplicação, não irá:"
                    "\n- violar qualquer um destes Termos e Condições de Uso;"
                    "\n- praticar falsidade, assim entendidas a falsidade de informações e a falsidade ideológica;"
                    "\n- fazer qualquer coisa ou praticar qualquer ato contrário à boa-fé e aos usos de costumes da etiqueta da internet e que possam ofender qualquer direito de terceiros;"
                    "\n- cometer fraude;"
                    "\n- acessar a Aplicação sem autorização, por meio de práticas de “hacking”, “password mining” ou qualquer outro meio fraudulento ou que represente violação a direito de terceiros;"
                    "\n- realizar ou incentivar atividades ilegais, incluindo (mas não se limitando a) promover ou facilitar o acesso, uso ou venda de substâncias ou dispositivos perigosos;"
                    "\n- deixar de cumprir com quaisquer leis, normas, regras, princípios e regulamentações aplicáveis;"
                    "\n- ajudar qualquer terceiro a realizar qualquer uma das ações vedadas por estes Termos e Condições de Uso.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "O Usuário se compromete que, ao usar a Aplicação, não irá:"
                        "\n- violar qualquer um destes Termos e Condições de Uso;"
                        "\n- praticar falsidade, assim entendidas a falsidade de informações e a falsidade ideológica;"
                        "\n- fazer qualquer coisa ou praticar qualquer ato contrário à boa-fé e aos usos de costumes da etiqueta da internet e que possam ofender qualquer direito de terceiros;"
                        "\n- cometer fraude;"
                        "\n- acessar a Aplicação sem autorização, por meio de práticas de “hacking”, “password mining” ou qualquer outro meio fraudulento ou que represente violação a direito de terceiros;"
                        "\n- realizar ou incentivar atividades ilegais, incluindo (mas não se limitando a) promover ou facilitar o acesso, uso ou venda de substâncias ou dispositivos perigosos;"
                        "\n- deixar de cumprir com quaisquer leis, normas, regras, princípios e regulamentações aplicáveis;"
                        "\n- ajudar qualquer terceiro a realizar qualquer uma das ações vedadas por estes Termos e Condições de Uso.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "6. VIOLAÇÃO DO TERMO",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "6. VIOLAÇÃO DO TERMO",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         Se o usuário violar qualquer item do Termo ou informações de outros usuários contidas na Aplicação, ou se a responsável pela aplicação acreditar que sua conduta ou conteúdo é ofensivo ou ilegal, que viola os direitos ou ameaça prejudicar terceiros, e que podem criar responsabilidade para a responsável ou terceiros, a responsável reserva o direito de investigar e tomar as medidas legais cabíveis, incluindo a remoção de conteúdo da Aplicação, notificação das autoridades competentes sobre a fonte do conteúdo, impedindo-o de acessar a Aplicação e promover o encerramento de sua Conta.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "Se o usuário violar qualquer item do Termo ou informações de outros usuários contidas na Aplicação, ou se a responsável pela aplicação acreditar que sua conduta ou conteúdo é ofensivo ou ilegal, que viola os direitos ou ameaça prejudicar terceiros, e que podem criar responsabilidade para a responsável ou terceiros, a responsável reserva o direito de investigar e tomar as medidas legais cabíveis, incluindo a remoção de conteúdo da Aplicação, notificação das autoridades competentes sobre a fonte do conteúdo, impedindo-o de acessar a Aplicação e promover o encerramento de sua Conta.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "7. DENÚNCIA DE ABUSOS E VIOLAÇÃO",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "7. DENÚNCIA DE ABUSOS E VIOLAÇÃO",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         O Usuário se compromete a denunciar quaisquer abusos ou violação destes Termos e Condições de Uso ou de quaisquer direitos de terceiros que observar e/ou for vítima quando da utilização da Aplicação. O Usuário deve reportar o abuso através do e-mail andedy@rede.ulbra.br."
                    "\n         Toda informação que o Usuário disponibiliza utilizando a Aplicação é uma informação que, por sua natureza e característica, é privada e confidencial, salvo as informações de contato que podem ser disponibilizadas para outros usuários para melhor comunicação. Ao revelar dados pessoais, tais como seu nome e endereço de e-mail nas conversas privadas por meio de outra ferramenta, o Usuário aceita e compreende que essa informação pode ser coletada e usada por outras pessoas para se comunicarem com ele, sem que seja imputável qualquer responsabilidade à responsável pela aplicação. Desta forma, a responsável recomenda que o Usuário seja, portanto, cuidadoso ao decidir compartilhar qualquer dado pessoal nesses meios.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         O Usuário se compromete a denunciar quaisquer abusos ou violação destes Termos e Condições de Uso ou de quaisquer direitos de terceiros que observar e/ou for vítima quando da utilização da Aplicação. O Usuário deve reportar o abuso através do e-mail andedy@rede.ulbra.br."
                        "\n         Toda informação que o Usuário disponibiliza utilizando a Aplicação é uma informação que, por sua natureza e característica, é privada e confidencial, salvo as informações de contato que podem ser disponibilizadas para outros usuários para melhor comunicação. Ao revelar dados pessoais, tais como seu nome e endereço de e-mail nas conversas privadas por meio de outra ferramenta, o Usuário aceita e compreende que essa informação pode ser coletada e usada por outras pessoas para se comunicarem com ele, sem que seja imputável qualquer responsabilidade à responsável pela aplicação. Desta forma, a responsável recomenda que o Usuário seja, portanto, cuidadoso ao decidir compartilhar qualquer dado pessoal nesses meios.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "8. RESPONSABILIDADES ",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "8. RESPONSABILIDADES ",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         O Usuário é considerado legalmente responsável pelo conteúdo de suas conversas em Ferramentas de terceiros e dados de contato disponibilizados para a Aplicação."
                    "\n         A responsável pela aplicação não se responsabiliza por quaisquer danos sofridos pelo Usuário ou terceiros que, de qualquer modo, tenha origem ou dependência relacionada à Aplicação."
                    "\n         A responsável se exime de quaisquer responsabilidades sobre prejuízos resultantes de qualquer interrupção ou erro na Aplicação, incluindo a impossibilidade de acessar a Aplicação e/ou os websites relacionados a ela."
                    "\n         A responsável não é a provedora dos serviços disponíveis na Aplicação, não detém a autoridade sobre eles, não realiza a precificação deles, tampouco, intervém na sua realização, cuja negociação se inicie na Aplicação."
                    "\n         O Usuário reconhece que não há nenhum envolvimento ou intervenção da Aplicação nos serviços firmados. Em nenhum caso Aplicação será responsável por qualquer dano ou prejuízo sofrido pelo Usuário em decorrência dos serviços ofertados."
                    "\n         A Aplicação não tem a obrigação de controlar, e efetivamente não controla, a oferta de serviços de terceiros e o cumprimento das obrigações decorrentes da oferta de serviços."
                    "\n         O Usuário reconhece e aceita que, ao realizar negociações com os outros Usuários, o faz por sua conta e risco, isentando a Aplicação de qualquer responsabilidade",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         O Usuário é considerado legalmente responsável pelo conteúdo de suas conversas em Ferramentas de terceiros e dados de contato disponibilizados para a Aplicação."
                        "\n         A responsável pela aplicação não se responsabiliza por quaisquer danos sofridos pelo Usuário ou terceiros que, de qualquer modo, tenha origem ou dependência relacionada à Aplicação."
                        "\n         A responsável se exime de quaisquer responsabilidades sobre prejuízos resultantes de qualquer interrupção ou erro na Aplicação, incluindo a impossibilidade de acessar a Aplicação e/ou os websites relacionados a ela."
                        "\n         A responsável não é a provedora dos serviços disponíveis na Aplicação, não detém a autoridade sobre eles, não realiza a precificação deles, tampouco, intervém na sua realização, cuja negociação se inicie na Aplicação."
                        "\n         O Usuário reconhece que não há nenhum envolvimento ou intervenção da Aplicação nos serviços firmados. Em nenhum caso Aplicação será responsável por qualquer dano ou prejuízo sofrido pelo Usuário em decorrência dos serviços ofertados."
                        "\n         A Aplicação não tem a obrigação de controlar, e efetivamente não controla, a oferta de serviços de terceiros e o cumprimento das obrigações decorrentes da oferta de serviços."
                        "\n         O Usuário reconhece e aceita que, ao realizar negociações com os outros Usuários, o faz por sua conta e risco, isentando a Aplicação de qualquer responsabilidade",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "9. PRIVACIDADE DE DADOS",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "4. REGISTRO E DADOS PESSOAIS",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         AO ACEITAR ESTES TERMOS DE USO, você automaticamente aceita todos os termos da política de privacidade da aplicação estabelecidos abaixo e, neste ato, autoriza a aplicação a coletar, armazenar, utilizar e divulgar seus dados pessoais conforme previsto em tal documento."
                    "\n\nCOLETA E PROCESSAMENTO DE DADOS PESSOAIS"
                    "\nDados pessoais só são coletados quando você os fornecer no curso, por exemplo, de seu cadastro na Aplicação, do preenchimento de formulários ou envio de e-mails, ou por meio de serviços, consultas ou pedidos."
                    "\nSeus dados pessoais permanecem conosco, nosso provedor e a prestadora de serviço de banco de dados, e não serão disponibilizados a terceiros, a qualquer título, por nós ou por pessoas instruídas por nós, a não ser que tenhamos o seu consentimento para tanto. Os dados pessoais que nós coletamos somente serão utilizados a fim de cumprir as nossas obrigações junto a você, além do envio de notificações e alertas. Importante: seus dados pessoais apenas serão utilizados para qualquer outra finalidade quando você tiver dado seu consentimento específico para tanto. Você pode revogar o seu consentimento para a utilização dos seus dados pessoais a qualquer momento, basta enviar um e-mail para andedy@rede.ulbra.br solicitando a revogação do seu consentimento. Por favor note que esta revogação de consentimento poderá impactar a disponibilidade do uso da Aplicação."
                    "\n\nRETENÇÃO DE DADOS"
                    "\n	Nós armazenamos dados pessoais pelo período necessário para realizar um serviço que você tenha solicitado ou para o qual você tenha concedido sua permissão, desde que não existam requisitos legais contrários, como por exemplo no caso de períodos de retenção exigidos pelo comércio ou normas tributárias."
                    "\n\nA SEGURANÇA"
                    "\nA Aplicação possui medidas de segurança técnicas e organizacionais para prevenir que a informação que você disponibilizou seja manipulada, intencionalmente ou não, perdida, destruída ou acessada por pessoas não autorizadas. "
                    "Os dados ficam salvos em banco de dados de responsabilidade da GOOGLE, por meio da Ferramenta FIREBASE, sendo a Aplicação isenta de responsabilidade sobre eventual violação desta."
                    "\n\nDIREITO DE OBTER E CORRIGIR DADOS E INFORMAÇÕES"
                    "\nO Usuário tem o direito de obter informações sobre todos os seus dados pessoais armazenados e,  poderá recebê-los, examiná-los e, se necessário, alterá-los ou apagá-los. Para fazer isso, basta enviar um e-mail para andedy@rede.ulbra.br. A eliminação dos seus dados pessoais será realizada, a menos que sejamos obrigados por lei a armazenar tais informações.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         AO ACEITAR ESTES TERMOS DE USO, você automaticamente aceita todos os termos da política de privacidade da aplicação estabelecidos abaixo e, neste ato, autoriza a aplicação a coletar, armazenar, utilizar e divulgar seus dados pessoais conforme previsto em tal documento."
                        "\n\nCOLETA E PROCESSAMENTO DE DADOS PESSOAIS"
                        "\nDados pessoais só são coletados quando você os fornecer no curso, por exemplo, de seu cadastro na Aplicação, do preenchimento de formulários ou envio de e-mails, ou por meio de serviços, consultas ou pedidos."
                        "\nSeus dados pessoais permanecem conosco, nosso provedor e a prestadora de serviço de banco de dados, e não serão disponibilizados a terceiros, a qualquer título, por nós ou por pessoas instruídas por nós, a não ser que tenhamos o seu consentimento para tanto. Os dados pessoais que nós coletamos somente serão utilizados a fim de cumprir as nossas obrigações junto a você, além do envio de notificações e alertas. Importante: seus dados pessoais apenas serão utilizados para qualquer outra finalidade quando você tiver dado seu consentimento específico para tanto. Você pode revogar o seu consentimento para a utilização dos seus dados pessoais a qualquer momento, basta enviar um e-mail para andedy@rede.ulbra.br solicitando a revogação do seu consentimento. Por favor note que esta revogação de consentimento poderá impactar a disponibilidade do uso da Aplicação."
                        "\n\nRETENÇÃO DE DADOS"
                        "\n	Nós armazenamos dados pessoais pelo período necessário para realizar um serviço que você tenha solicitado ou para o qual você tenha concedido sua permissão, desde que não existam requisitos legais contrários, como por exemplo no caso de períodos de retenção exigidos pelo comércio ou normas tributárias."
                        "\n\nA SEGURANÇA"
                        "\nA Aplicação possui medidas de segurança técnicas e organizacionais para prevenir que a informação que você disponibilizou seja manipulada, intencionalmente ou não, perdida, destruída ou acessada por pessoas não autorizadas. "
                        "Os dados ficam salvos em banco de dados de responsabilidade da GOOGLE, por meio da Ferramenta FIREBASE, sendo a Aplicação isenta de responsabilidade sobre eventual violação desta."
                        "\n\nDIREITO DE OBTER E CORRIGIR DADOS E INFORMAÇÕES"
                        "\nO Usuário tem o direito de obter informações sobre todos os seus dados pessoais armazenados e,  poderá recebê-los, examiná-los e, se necessário, alterá-los ou apagá-los. Para fazer isso, basta enviar um e-mail para andedy@rede.ulbra.br. A eliminação dos seus dados pessoais será realizada, a menos que sejamos obrigados por lei a armazenar tais informações.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "10. LEGISLAÇÃO APLICÁVEL E FORO",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "10. LEGISLAÇÃO APLICÁVEL E FORO",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         Estes Termos e Condições de Uso são governados e interpretados segundo as leis da República Federativa do Brasil e todas as disputas, ações e outros assuntos relacionados serão determinados de acordo com essa legislação. "
                    "\n         Para fins legais a Responsável elege o Foro da Comarca de Tramandaí, Rio Grande do Sul, para que julgue eventuais controvérsias ou inobservâncias pelas partes que firmam relação nestes Termos.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         Estes Termos e Condições de Uso são governados e interpretados segundo as leis da República Federativa do Brasil e todas as disputas, ações e outros assuntos relacionados serão determinados de acordo com essa legislação. "
                        "\n         Para fins legais a Responsável elege o Foro da Comarca de Tramandaí, Rio Grande do Sul, para que julgue eventuais controvérsias ou inobservâncias pelas partes que firmam relação nestes Termos.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "11. DISPOSIÇÕES GERAIS",
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.start,
                    semanticsLabel: "4. REGISTRO E DADOS PESSOAIS",

                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "         Você concorda que não se constitui qualquer relação de emprego, parceria, representação, agência ou joint venture entre você e a responsável com resultado do seu uso da Aplicação. Estes Termos de Uso constituem o acordo integral entre você e a responsável com relação ao seu uso da Aplicação, sendo adicional a qualquer contrato celebrado entre você e a responsável.",
                    textAlign: TextAlign.justify,
                    semanticsLabel:
                        "         Você concorda que não se constitui qualquer relação de emprego, parceria, representação, agência ou joint venture entre você e a responsável com resultado do seu uso da Aplicação. Estes Termos de Uso constituem o acordo integral entre você e a responsável com relação ao seu uso da Aplicação, sendo adicional a qualquer contrato celebrado entre você e a responsável.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 0.1,
                      // wordSpacing: 0.5,
                      color: Color(0xFF444444),
                    ),
                  ),
                  SizedBox(height: 34),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //side: BorderSide(color: Colors.red),
                    ),
                    child: Text(
                      "Voltar",
                      style:
                          TextStyle(fontSize: 20.0, fontFamily: 'Montserrat'),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(12.0),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Home()));
                    },
                  ),
                  SizedBox(height: 34),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
