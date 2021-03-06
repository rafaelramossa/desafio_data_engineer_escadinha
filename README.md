

## Questão 1

Como engenheiro de dados, você foi requisitado a fazer uma ETL em um novo projeto. Esta ETL consiste na leitura de um arquivo excel, extração do valor de algumas colunas do excel e transformação destes dados. Por fim, os dados serão armazenados em uma instância do SQL Server.

O arquivo .xls consiste em dados coletados da ANP, com o valor das vendas de combustíveis para cada mês dos anos entre 2000 e o ano/mês atual. Estes valores de venda são números inteiros positivos. Por motivos técnicos, você não poderá fazer a leitura desse arquivo como .xls, mas sim como um arquivo da biblioteca libreoffice do Linux : .ods. Ao fazer a conversão de .xls para .ods, você verificou que para alguns arquivos os valores no .ods encontram-se fora da ordem correta.

As colunas presentes no arquivo .ods são: Nome do Combustível, Unidade de Medida, Refinaria, Estado, Ano, Janeiro, Fevereiro, Março, Abril, Maio, Junho, Julho, Agosto, Setembro, Outubro, Novembro, Dezembro, Total. As colunas dos meses contém os valores das vendas correspondentes para aquele mês, e a coluna Total contém a soma dos valores de cada mês da linha correspondente. Entretanto, em algumas conversões de arquivos, os valores dos meses e do total sofrem um shuffle de n + k casas para a direita, a partir da primeira linha, com k sendo incrementado de 1 a cada linha seguinte. Mais especificamente, a primeira linha sofre um shuffle de n casas, a segunda linha sofre um shuffle de n + 1 casas, a terceira linha sofre um shuffle de n + 2 casas... a décima terceira linha sofre um shuffle de 13 casas (retornando à configuração original), e assim até o fim do arquivo.

Internamente, você e seus colegas de equipe apelidaram esse problema de "Escadinha".

Para solucionar o problema, entregue um código que:

**1) Verifica se há escadinha, dada uma matriz como os exemplos acima.**

Para solucionar o exercicio 1 utilizei como base a função diag do numpy para identificar se é uma matriz diagonal.<br />
Criado a função "is_escadinha" que está no arquivo `Questao1_Python.ipynb`

**2) Se houver escadinha, mapear os dados corretamente, retornando a matriz correta.**

Para solucionar o exercicio 2 entendi que o Total (soma de todos os meses) sempre será o maior valor de uma linha e deverá sempre estar na ultima posição. Utilizando mapeamento de posição e indice no Python retorno a matriz correta.<br />
Criado a função "matriz_correta" que está no arquivo `Questao1_Python.ipynb`


**3) Se não houver escadinha, retorne se a matriz está com uma formatação que pode ser utilizada (padrão correto) ou se corresponde a um padrão inutilizável.**

Se não houver uma escadinha e a matriz for invertida a função "is_escadinha" irá retornar o texto "Matriz Invertida".

**4) Caso fossem possíveis números negativos nos valores dos meses (não no total), a sua solução ainda seria válida? Caso não, como seria a nova solução?**

Sim! Pois não estou utilizando os valores positivos para a solução e sim funções especificas do Python.

## Questão 2

Você tem duas tabelas em um banco de dados relacional.

Tabela Vendedor:<br />
vendedor_id (int)<br />
vendedor_nome (string)<br />

Tabela Venda:<br />
venda_id (int)<br />
vendedor_id (int)<br />
venda_data (data dd/mm/aaaa)<br />
venda_valor (double)<br />

**Retorne a lista com a venda de valor mais alto de cada vendedor para o ano de 2016. Não utilize as funções Min/Max.**

Disponibizei no repositorio dois scripts conforme segue abaixo:<br />
`Questao2_CreateDatabase_InsertTable.sql` com a criação do Database, criação das Tabelas e Carga dos Dados.<br />
`Questao2_Select.sql` com a solução do exercicio, nele para evitar o uso do MAX utilizei uma subquery com o ROW_NUMBER() OVER e PARTITION BY recurso este do SQL Server.<br />

Para solucionar este desafio criei as tabelas em um ambiente no RDS da AWS.

### Acesso ao Database RADIX no ambiente da AWS

![](SQLSERVER.PNG)

Endpoint: poseidon.cbwndpuop4x8.us-east-2.rds.amazonaws.com<br />
Porta: 1433<br />
Login: RadixRecruit<br />
Password: r4d1x<br />


## Nota da Radix

### Desafio Data Engineering

Você encontrará as instruções para o desafio no PDF deste branch.
Boa Sorte!


### Finalização do Desenvolvimento:
1. Ao finalizar, envie um email para o o recrutador responsável pelo seu processo seguindo o padrão de assunto: "Prova 1 - [Nome] - [Tecnologia]". 
2. Não esqueça de adicionar o usuário radix.recruit como reporter do seu repositório. 
3. Crie ou edite o README do seu repositório para realizar comentários e/observações, por exemplo, o que achou dos desafios ou maiores dificuldades encontradas.
