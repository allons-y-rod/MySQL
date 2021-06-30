CREATE DATABASE Oficina_Mecanica;

CREATE TABLE Departamentos (
Id INT NOT NULL auto_increment,
Nome varchar(25) not null,
primary key(Id)
);

insert into Departamentos 
(Id, Nome)
values
(1, 'RH'),
(2, 'Vendas'),
(3, 'Reparos');

create table Empregados(
Id int not null auto_increment,
Nome varchar(35) not null,
Sobrenome varchar(50) not null,
Telefone varchar(15),
ManagerId int,
DepartamentoId int not null,
Salario float not null,
Contrato date not null,
primary key(Id),
foreign key(ManagerId) references Empregados(Id),
foreign key(DepartamentoId) references Departamentos(Id)
);

insert into Empregados
(Id, Nome, Sobrenome, Telefone, ManagerId, DepartamentoId, Salario, Contrato)  
values
(1, 'James', 'Smith', 1234567890, NULL, 1, 1000, '2002-01-01'),
(2, 'John', 'Johnson', 2468101214, '1', 1, 400, '2005-03-23'),
(3, 'Michael', 'Williams', 1357911131, '1', 2, 600, '2009-05-12'),
(4, 'Johnathon', 'Smith', 1212121212, '2', 1, 500, '2016-07-24');

create table Clientes(
Id int not null auto_increment,
Nome varchar(35) not null,
Sobrenome varchar(50) not null,
Email varchar(100) not null,
Telefone varchar(15),
Contato_preferencial varchar(10) not null,
primary key(Id)
);

insert into Clientes
(Id, Nome, Sobrenome, Email, Telefone, Contato_preferencial)
values
(1, 'William', 'Jones', 'william.jones@example.com', '3347927472', 'Telefone'),
(2, 'David', 'Miller', 'dmiller@example.net', '2137921892', 'Email'),
(3, 'Richard', 'Davis', 'richard0123@example.com', NULL, 'Email');

create table Carros(
Id int not null auto_increment,
ClienteId int not null,
EmpregadoId int not null,
Modelo varchar(50) not null,
Estado varchar(25) not null,
Custo_total float not null,
primary key(Id),
foreign key(ClienteId) references Clientes(Id),
foreign key(EmpregadoId) references Empregados(Id)
);

insert into Carros
(Id, ClienteId, EmpregadoId, Modelo, Estado, Custo_total)
values
('1', '1', '2', 'Ford F-150', 'PRONTO', '230'),
('2', '1', '2', 'Ford F-150', 'PRONTO', '200'),
('3', '2', '1', 'Ford Mustang', 'AGUARDANDO', '100'),
('4', '3', '3', 'Toyota Prius', 'CONSERTANDO', '1254');
