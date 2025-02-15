-- Criar a tabela de usuário e definir as constraints
CREATE TABLE usuario 
(
    id_usuario NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100)
);

SELECT * FROM usuario;

-- Criar a tabela de Produto e definir as constraints
CREATE TABLE produto
(
    id_produto 		NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome 			VARCHAR(100) 	NOT NULL,
    descricao 		VARCHAR(200) 	NOT NULL,
    marca 			VARCHAR(50) 	NOT NULL,
    quantidade 		NUMBER(5,3) 	NOT NULL,
    unidade_medida 	VARCHAR(5) 		NOT NULL,
    codigo_barras 	VARCHAR(13) 	NOT NULL,
    CONSTRAINT CHK_UNIDADE_MEDIDA CHECK (unidade_medida IN ('G', 'KG', 'L', 'ML', 'CM', 'M', 'MM'))  
);

SELECT * FROM produto;
-- Criar a tabela de Produto_Preco e definir as constraints
CREATE TABLE produto_preco
(
    id_produto_preco 		NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    id_produto				NUMBER 		NOT NULL,
    preco					NUMBER(6,2) NOT NULL,
    cadastrado_em			DATE		DEFAULT SYSDATE NOT NULL,
	cadastrado_por			NUMBER		NOT NULL,
    aplicar_inicio			DATE		NOT NULL,
    aplicar_fim				DATE		NOT	NULL,
    CONSTRAINT FK_PRODUTO_PRODUTO_PRECO FOREIGN KEY (id_produto)
    	REFERENCES produto (id_produto),
    CONSTRAINT FK_USUARIO_PRODUTO_PRECO FOREIGN KEY (cadastrado_por)
    	REFERENCES usuario (id_usuario)
);

SELECT * FROM produto_preco;
