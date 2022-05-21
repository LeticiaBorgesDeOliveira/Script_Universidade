/*FAZENDO SELECTS*/
--SELECT COM OPERADORES IN

select * from aluno
where nome in ('Lizzo','Harry','Alicia')

--SELECT COM OPERADOR LIKE%%

select * from aluno 
where nome like 'a%a'

select * from aluno 
where nome like '_izzo'

/*arredondando a media de um valor*/
select round(avg(valor_pago_curso),2) as "Média do valor dos cursos"
from aluno_curso

/*contando os alunos por estado */
select uf, count(*) as total
from endereco
group by uf

/*fazendo a conta da idade com timestamp*/
select timestampdiff(year,'1997-11-14',curdate()) as idade;

/*fazendo a conta da idade com a data de nascimento armazenada no banco*/
select data_nascimento, 
	   curdate() as data_atual, 
	   timestampdiff(year, data_nascimento,curdate()) as idade 
from aluno;

/*relatorio com id, nome, data nascimento, data atual e a idade*/

select idAluno,
	   nome,
	   data_nascimento, 
	   curdate() as data_atual, 
	   timestampdiff(year, data_nascimento,curdate()) as idade 
from aluno;

/*relatorio com aniversariantes do dia*/
select idAluno,
	   nome,
	   data_nascimento, 
	   extract(month from data_nascimento) as data_nascimento_mes,
	   extract(day from data_nascimento) as data_nascimento_dia,

	   curdate() as data_atual, 
	   extract(month from curdate()) as data_atual_mes,
	   extract(day from curdate()) as data_atual_dia,

	   timestampdiff(year, data_nascimento,curdate()) as idade 
from aluno
where extract(month from data_nascimento)=extract(month from curdate())
	  and 
	  extract(day from data_nascimento)=extract(day from curdate());