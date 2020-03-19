# iugu challenge

Essa é uma aplicação web criada para o desafio da iugu. O objetivo da aplicação é realizar transações por meio de dois arquivos CSV: um contendo informações sobre contas (número e saldo) e outro contendo informações da transação (número da conta e valor).

A aplicação foi feita com as seguintes tecnologias:

- [Ruby](https://www.ruby-lang.org/pt/)
- [sqlite3](http://www.sqlite.org)
- [Active Record](https://rubygems.org/gems/activerecord/versions/4.2.6?locale=pt-BR)
- [Standalone Migrations](https://github.com/thuss/standalone-migrations) - Para ajudar no processo de migrações em projetos não Rails


### Iniciando

```
1) Abra seu terminal e clone o projeto:
git clone https://github.com/aldowitzke/iugu_challenge.git
# É possível que seja pedido suas credenciais para clonar o repositório

2) Entre no novo diretório criado
cd iugu_challenge

3) Vamos configurar:
bundle install
rake db:create db:migrate

4) Rode a aplicação passando os dois arquivos como parâmetros
ruby app/main.rb contas.csv transacoes.csv
```

### Arquivos CSV

Dentro do projeto há dois arquivos CSV: "contas.csv" e "transacoes.csv". O arquivo "contas.csv" possui o numero da conta e o saldo em centavos (exemplo: 123,1050 -> Conta 123 com $10.50 de saldo). Já o arquivo "transacoes.csv" contém o número da conta que a transação será realizada e o valor dessa transação (exemplo: 123,-1000 -> conta 123 retirando $10.00).
Fique a vontade para editar, adicionar ou remover os valores desses arquivos. Tenha em mente que o formato deve sempre ser conta,saldo (para o arquivo "contas.csv") e conta,valor (para o arquivo "transacoes.csv")

### Para os avaliadores

Gostaria de compartilhar algumas considerações:

- Tentei abstrair as classes ao máximo que pude, tendo uma classe para construir as contas a partir CSV, outra para construir as transações e uma terceira classe para realizar a regra de negócio;
- Levo em conta que os parâmetros passados sempre serão na ordem "contas.csv" e "transacoes.csv";
- E o padrão dos arquivos sempre será o mesmo (conta,valor);
- Não haverão contas repetidas no arquivo "contas.csv";
- Toda vez que rodo a aplicação, eu deleto o registro passado de contas e transações. Não há uma lógica para checar se a conta já existe;
- Todas as transações terão um número de uma conta existente no "contas.csv";
