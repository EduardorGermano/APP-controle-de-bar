const criarTabelas = [
  '''
    CREATE TABLE bar(
      id INTERGET NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,localizacao VARCHAR(200) NULL
      ,estoque_atual INT
      ,responsavel VARCHAR(200) NOT NULL
    )
  '''
];

const insercoes = 
[
  '''
    INSERT INTO bar (nome, localizacao, estoque_atual, responsavel)
    VALUES ('Bar piscina', 'Piscina superior', '300', 'Fernando')
  '''
  '''
    INSERT INTO bar (nome, localizacao, estoque_atual, responsavel)
    VALUES ('Bar pista', 'Piscina do meio', '500', 'Igor')
  '''
  '''
    INSERT INTO bar (nome, localizacao, estoque_atual, responsavel)
    VALUES ('Bar Principal', 'Ao lado da lanchonete', '1000', 'Monique')
  '''
];
