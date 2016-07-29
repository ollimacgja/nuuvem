# Desafio Nuuvem

Este desafio consistia na elaboração de uma de jogos simples, mas com foco no backoffice.

## Tecnologias
* Rails 4.1.16
* Ruby 2.2.5
* SQlite3
* Rspec
* RVM

##Observações sobre Gems
Utilizei duas gems para me auxiliar na elaboração dos testes e refatoração do código.
* [Rubocop](https://github.com/bbatsov/rubocop)
* [SimpleCov](https://github.com/colszowka/simplecov)

A gem simplecov me mostra o percentual de cobertura de código toda vez que rodo os testes. Segundo o mesmo atingi 100% de cobertura. Essas informações podem ser vistas na pasta 'coverage\index.html'. Ele tem divisões interessantes e mostra as linhas que foram testadas pelos seus specs.

A gem Rubocop é uma gem que varre seu código em busca de más práticas. Ele se baseia no [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) que é um guia de boas práticas ao se programar em Ruby. Ao rodar o comando 'rubocop' ele procura as ofensas as boas práticas e alerta para as mesmas. Consegui zerar as advertencias apenas ignorando algumas questões de layout.

##Iniciando a Aplicação

Para iniciar a aplicação é necessário primeiramente configurar o banco de dados. Para isso utilize o seguinte comando:

```
  rake db:setup
```

Este comando irá cria o banco de dados e populá-lo com as informações do arquivo seed.rb

Após este processo ser realizado, poderemos iniciar o servidor com o comando:

```
  rails s
```

###Acesso ao backoffice:

Após acessar a aplicação em

```
  http://localhost:3000
```

realize o login em uma das contas de administrador:

```
  admin@admin.com senha: '123456'
  dev@dev.com senha '654321'
```

Após realizar seu login, basta acessar o seguinte endereço:

```
  http://localhost:3000/admin
```

######Observações
* Ao se editar a url da capa na edição de jogos, a thumbnail será atualizada para mostrar a foto que será utilizada como capa. Verificar se está aparecendo corretamente.
* É possível criar novos usuários, categorias e games.
* Todo o site é facilmente adaptado para outra lingua, sendo necessário apenas incluí-la nas configurações da aplicação e incluir o seu respectivo YML na pasta 'config/locales'. Ex: Para incluir a lingua espanhol, basta incluir o ':es' em config.i18n.available_locales no aquivo 'config/application.rb' e incluir es.yml na pasta 'config/locale'.
```
  config.i18n.available_locales = [:en, 'pt-BR', :es]
```
* Caso não seja incluido o arquivo YML, a lingua padrão será utilizada.