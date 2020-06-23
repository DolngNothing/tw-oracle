
CREATE TABLE student(
  id varchar(255) primary key ,
  name varchar(255),
  age int,
  sex varchar(255)
);

INSERT INTO student values ('001','zhangsan',18,'male');
INSERT INTO student values ('002','lisi',20,'female');

CREATE TABLE subject(
  id varchar(255) primary key ,
  subject varchar(255),
  teacher varchar(255),
  description varchar(255)
);

INSERT INTO subject values ('1001',	'Chinese',	'Mr. Wang',	'the exam is easy');
INSERT INTO subject values ('1002',	'math',	'Miss Liu',	'the exam is difficult');

CREATE TABLE score(
  id number primary key ,
  student_id varchar(255),
  subject_id varchar(255),
  score number(9,2),
  constraint fk_student foreign key (student_id) references student (id),
  constraint fk_subject foreign key (subject_id) references subject (id)
);

create sequence score_id
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 2000
cycle;

CREATE OR REPLACE TRIGGER score_trg
  BEFORE INSERT ON score
  FOR EACH ROW -- WHEN (new.ID is null) 设置主键存在时，不触发触发器
BEGIN
  SELECT score_id.NEXTVAL INTO :NEW.id FROM DUAL;
END;



insert into score (student_id,subject_id,score) values ('001','1001',80);
insert into score (student_id,subject_id,score) values ('002','1002',60);
insert into score (student_id,subject_id,score) values ('001','1001',70);
insert into score (student_id,subject_id,score) values ('002','1001',60.5);