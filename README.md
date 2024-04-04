 Mini Sistema Web para Armazenamento e Busca de Arquivos de Música

## Visão Geral

Este é um mini sistema web desenvolvido em Java Web tradicional para permitir o armazenamento e a busca de arquivos de música no padrão mp3. O sistema consiste em dois módulos principais: o módulo de envio de músicas e o módulo de busca de músicas.

## Funcionalidades

### Módulo de Envio de Músicas

- Permite que o usuário autenticado envie um arquivo de música com informações associadas.
- As informações necessárias incluem o nome da música, o estilo (selecionado de um combobox) e o cantor.
- O sistema gera automaticamente o nome do arquivo da música com base nas informações fornecidas.
- Validação de campos do formulário para evitar caracteres especiais, exceto sublinhado (_) e espaço em branco.

### Módulo de Busca de Músicas

- Permite que o usuário busque arquivos de música com base em uma palavra-chave.
- Retorna todas as ocorrências encontradas.
- Os resultados da busca podem ser reproduzidos diretamente na página usando a tag `<audio>` do HTML5.

### Página de Login

- O usuário precisa estar autenticado para acessar o sistema.
- O login é feito usando um email válido, e a senha é a primeira parte do email (antes do @).

## Implementação

- Desenvolvido em Java Web tradicional usando Servlets e JSP.
- Utiliza Bootstrap para o layout e o estilo da página.
- Implementa medidas de segurança para proteger contra vulnerabilidades.
- Validação de dados no lado do cliente e no lado do servidor.
- Testes e depuração abrangentes para garantir o funcionamento correto.
