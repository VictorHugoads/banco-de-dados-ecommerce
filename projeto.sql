📌 Projeto: Banco de Dados para E-commerce

📍 Descrição:
Este repositório contém a modelagem conceitual e lógica do banco de dados para um sistema de e-commerce. O objetivo é criar uma base de dados robusta, escalável e eficiente para a venda de produtos online, facilitando a gestão de clientes, pedidos, fornecedores, estoque e pagamentos, com a flexibilidade de adaptar o sistema às suas necessidades futuras.

A modelagem foi desenvolvida no DB Designer, com um passo a passo claro para implementação.

🔹 Entidades Principais e Relacionamentos:

1️⃣ Produto
Os produtos são vendidos por vendedores distintos na mesma plataforma. Cada produto pertence a um fornecedor específico e pode aparecer em vários pedidos. O estoque de cada produto é monitorado para evitar problemas de disponibilidade.

2️⃣ Cliente
O cliente pode ser Pessoa Física (PF) ou Pessoa Jurídica (PJ), podendo se cadastrar utilizando CPF ou CNPJ. O cliente pode ter múltiplos métodos de pagamento e realizar várias compras, com direito a devolução dentro de um período específico.

3️⃣ Pedidos
O pedido contém informações detalhadas sobre a compra e pode incluir um ou mais produtos. Possui status que indicam o andamento da entrega, além de um código de rastreamento. O pedido pode ser cancelado em qualquer fase do processo.

4️⃣ Fornecedor
Cada produto é vinculado a um fornecedor. O fornecedor pode oferecer múltiplos produtos, permitindo flexibilidade na escolha do produto para cada cliente.

5️⃣ Estoque
Cada produto possui um estoque associado, que pode ser gerido tanto pela plataforma quanto pelos próprios fornecedores. O controle de estoque é fundamental para garantir a disponibilidade dos produtos.

6️⃣ Pagamento
O cliente pode cadastrar múltiplos métodos de pagamento (cartão, boleto, Pix, etc.), mas cada pedido pode ser pago apenas com um único método.

7️⃣ Entrega
Cada pedido está vinculado a uma entrega, com status (pendente, enviado, entregue, devolvido, etc.) e rastreamento detalhado. A entrega é crucial para a experiência do cliente e deve ser gerenciada de forma eficiente.

🛠 Modelagem Conceitual
A modelagem segue o modelo Entidade-Relacionamento (ER), criado no DB Designer. Acesse o diagrama para mais detalhes https://erd.dbdesigner.net/designer/schema/1740177687-e-commercer-refinado-jj.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
🎯 Passo a Passo para Criar o Banco de Dados

🏗 1️⃣ Criando as Tabelas

Clientes

sql
Copiar
Editar
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('PF', 'PJ') NOT NULL,  
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT NOT NULL
);

Produtos

sql
Copiar
Editar
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    id_fornecedor INT,
    estoque INT NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

Pedidos

sql
Copiar
Editar
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'pago', 'enviado', 'entregue', 'cancelado') DEFAULT 'pendente',
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
🎯 Resumo da Estrutura de Tabelas

Cliente: id_cliente, nome, cpf_cnpj, endereço (1 cliente → N pedidos)

Produto: id_produto, nome, preco, estoque (N produtos → N pedidos)

Fornecedor: id_fornecedor, nome, contato (1 fornecedor → N produtos)

Pedido: id_pedido, id_cliente, total (1 pedido → N produtos)

Pedido_Produto: id_pedido, id_produto, quantidade (N:N entre Pedido e Produto)

Pagamento: id_pagamento, tipo, status (1 pedido → 1 pagamento)

Entrega: id_entrega, id_pedido, status (1 pedido → 1 entrega)

📜 Conclusão

Com essas melhorias, o banco de dados para o e-commerce oferece flexibilidade, permitindo uma gestão eficiente e escalável, além de garantir uma experiência de compra tranquila para o cliente. O sistema foi projetado para suportar o crescimento da plataforma e facilitar a implementação de novas funcionalidades no futuro.
