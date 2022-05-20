

Create database Universidade;

use Universidade;

create table aluno(
	idAluno int not null auto_increment, 
	nome varchar(30) not null,
	sexo char(1) not null,
	data_nascimento date not null,
	ativo_sn char(1) not null,
	cpf char(11) not null,
	email varchar(50) not null,
	
	
	constraint pk_aluno primary key(idAluno)
);

insert into aluno (nome,	sexo ,data_nascimento,ativo_sn, cpf, 		  email)
	values	('Lana Delrey', 'F',  '1960-03-03',	  's',	  	'11111111111','Lana@universidade.com'),
			('Rihanna',		'F',  '1959-01-01',	  's',	    '11111111112','Rih@universidade.com'),
			('Elvis',		'M',  '1960-02-19',	  's',	    '11111111113','El@universidade.com'),
			('Harry',		'M',  '1970-12-20',	  's',	    '11111111114','Harry@universidade.com'),
			('Doja',		'F',  '1970-06-15',	  'n',	    '11111111115','Doja@universidade.com'),
			('Justin',		'M',  '1970-12-20',	  's',	    '11111111116','jus@universidade.com'),
			('Lizzo',		'F',  '1970-06-15',	  'n',	    '11111111117','liz@universidade.com'),
			('Bruno',		'M',  '1970-12-20',	  's',	    '11111111118','Bru@universidade.com'),
			('Alicia',		'F',  '1970-06-15',	  'n',	    '11111111119','ali@universidade.com');



create table endereco(
	idEndereco int not null auto_increment,
	idAluno int,

	rua varchar(20) not null,
	bairro varchar(20) not null,
	numero int not null,
	cidade varchar(20) not null,
	uf varchar(20) not null,
	pais varchar(20) not null,
	cep char(8) not null,
	complemento varchar(20),

	constraint pk_endereco primary key(idEndereco),
	constraint fk_aluno_endereco foreign key(idAluno) references aluno(idAluno)
);

insert into endereco (idAluno, rua,			 			bairro,				numero,		cidade,			uf,	  pais,	  cep,		 complemento)
	values 			 (1,	  'rua verbeiro',			'São Pedro',		300,		'São Paulo',	'SP','Brasil','03060300','ap10'),
		   			 (2,	  'rua janeiro', 			'São Pedro',		30,			'São Paulo',	'SP','Brasil','03090500','ap16'),
		   			 (3,	  'primeiro de abril',		'São Pedro',		10,			'São Paulo',	'SP','Brasil','03060000','ap12'),
		   			 (4,	  'quinta de janeiro',		'São agostinho',	3,			'São Paulo',	'SP','Brasil','03069120','ap01'),
		   			 (5,	  'quindim',				'São joao',			1596,		'São Paulo',	'SP','Brasil','03060020','ap05'),
		   			 (6,	  'itaipu',					'São pederneira',	63,			'São Paulo',	'SP','Brasil','03060220','ap30'),
		   			 (8,	  'itapuan',				'forença',			1592,		'São Paulo',	'SP','Brasil','03069020','ap22'),
		   			 (9,	  'primeiro de maio',		'pedreira',			15,			'São Paulo',	'SP','Brasil','09060020','ap15');



create table telefone(
	idTelefone int not null auto_increment,
	idAluno int,

	ddd char(3) not null,
	numero char(9) not null,

	constraint pk_telefone primary key(idTelefone),
	constraint fk_aluno_telefone foreign key(idAluno) references aluno(idAluno)
);

insert into telefone (idAluno,ddd,	numero)
	values			 (1,	  '11','987654321'),
					 (2,	  '11','987654331'),
					 (3,	  '11','987654341'),
					 (4,	  '11','987654351'),
					 (5,	  '11','987654351')
					 (6,	  '11','987654351')
					 (7,	  '11','987654351')
					 (8,	  '11','987654351')
					 (9,	  '11','987654351')


create table curso(
	idCurso int not null auto_increment,
	descricao varchar(50),
	
	constraint pk_curso primary key(idCurso)
);

insert into curso(descricao)
	values 		 ('curso completo do desenvolvedor nodejs e mongobd'),
				 ('desenvolvedor multiplataforma android e ios'),
				 ('desenvolvimento web com angular'),
				 ('desenvolvimento web completo 2019');

create table aluno_curso(
	idAluno_curso int not null auto_increment,
	idAluno int,
	idCurso int,
	
	data_inscricao_curso date not null,
	valor_pago_curso decimal(10,2),

	constraint pk_aluno_curso primary key(idAluno_curso),
	constraint fk_idaluno_aluno_curso foreign key(idAluno) references aluno(idAluno),
	constraint fk_idcurso_aluno_curso foreign key(idCurso) references curso(idCurso)
);

insert into aluno_curso(idAluno,idCurso,data_inscricao_curso,valor_pago_curso)
	values			   (1,		1,	    '2020-01-03',		 '600.39'),
					   (2,		2,	    '2020-01-03',		 '600.39'),
					   (3,		3,	    '2020-01-03',		 '600.39'),
					   (4,		4,	    '2020-01-03',		 '600.39');



create table gasto(
	idgasto int not null auto_increment,
	ano int not null,
	tipo enum('previsto','realizado') not null,

	janeiro decimal(10,2),
	fevereiro decimal(10,2),
	marco decimal(10,2),
	abril decimal(10,2),
	maio decimal(10,2),
	junho decimal(10,2),
	julho decimal(10,2),
	agosto decimal(10,2),
	setembro decimal(10,2),
	outubro decimal(10,2),
	novembro decimal(10,2),
	dezembro decimal(10,2),

	constraint pk_idgasto primary key(idgasto)
);
