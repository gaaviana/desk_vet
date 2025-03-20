# MODELOS

 são responsáveis pela lógica de negócios e interação com o banco de dados. Eles representam as entidades ou objetos de dados da aplicação e contêm métodos para manipular ou acessar esses dados.

 ## CLASS

- Class **animal**: Representa um animal. Ela tem duas propriedades: \
``$nome`` (É o nome do animal) \
``$especie`` (É a espécie do animal, que é um objeto da classe especie.) \
No método __construct(), que é o construtor da classe, são inicializadas essas propriedades. O __construct() é chamado quando o objeto da classe é criado.

**O construtor permite passar valores ao criar o objeto. Se nenhum valor for passado para a espécie, ele cria um objeto da classe especie vazio.**

- Classe **especie**: Representa a espécie do animal. Ela tem uma propriedade: \
``$nome`` (guarda o nome da espécie como "Cachorro", "Gato" etc.)

- Classe **prontuario**: Serve para guardar informações relacionadas a um animal. Ela tem: \
``$animal`` (Um objeto da classe animal, ou seja, o animal que está sendo tratado.) \
``$tratamento`` (Um objeto da classe tratamento, que descreve o tratamento que o animal está recebendo.) \
``$data_tratamento`` (Guarda a data em que o tratamento foi feito.) \
``$descricao`` (Descrição do tratamento ou qualquer outra informação relevante.)

**Nota: Não há um construtor definido, então as propriedades podem ser definidas diretamente depois que o objeto da classe prontuario for criado.** 

- Classe **tratamento**: Representa um tratamento que pode ser dado a um animal. Ela tem: \
``$nome`` (O nome do tratamento como "Vacinação", "Cirurgia".) \
``$descricao`` (Uma descrição detalhada sobre o tratamento.) \


## MÉTODO __construct()
O método ``__construct()`` é um método especial chamado construtor. Ele é **executado automaticamente quando você cria um objeto dessa classe**. No caso dessas classes, o construtor é usado para inicializar as propriedades dos objetos. Se não passarmos valores para elas, **o construtor pode definir valores padrões.**

Parâmetros com valor padrão ($nome = null): Isso significa que, se nenhum valor for passado para a propriedade, ela será configurada como null (nulo, sem valor). Esse é o valor padrão.

---

### Tipos de Dados nas Propriedades e Parâmetros
Algumas propriedades e parâmetros têm tipos definidos, como **especie $especie**. Isso significa que o valor esperado para essa variável deve ser um **objeto da classe especie**.

O tipo **null** é usado para permitir que a propriedade ou o parâmetro **não tenha um valor inicialmente**.

---

## RESUMO
animal: Representa um animal com um nome e uma espécie.

especie: Representa uma espécie de animal, com um nome.

prontuario: Guarda informações sobre o tratamento de um animal, como qual animal, qual tratamento, quando foi feito e a descrição do tratamento.

tratamento: Representa um tratamento que pode ser dado a um animal, com um nome e uma descrição.

