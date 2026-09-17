create table aluno (
   id_aluno serial primary key,
   nome varchar(200) not null,
   data_nascimento Date not null
);

Create table disciplina (
   id_disciplina serial primary key,
   nome varchar(40)not null,
   carga_horaria Integer not null
);

Create Table matricula (
   id_matricula Serial Primary Key,
   data_matricula Date Not Null,
   id_aluno INTEGER NOT NULL,
   id_disciplina INTEGER NOT NULL,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno),

    FOREIGN KEY (id_disciplina)
        REFERENCES disciplina(id_disciplina)
	
);





SELECT * FROM aluno;
SELECT * FROM disciplina;
SELECT * FROM matricula;