use School
--表实体完整性
alter table Student
	add constraint pk_sno primary key(Sno)
alter table Teacher 
	add constraint pk_tno primary key(Tno)
alter table Course
	add constraint pk_cno primary key(Cno)
alter table Student
	add constraint unique_s unique(Sno)
alter table Teacher
	add constraint unique_t unique(Tno)
alter table Course
	add constraint unique_c unique(Cno)

--参照完整性
alter table SC with nocheck
	add constraint fk_s_sc foreign key(Sno) references Student(Sno)
	on delete cascade
alter table SC with nocheck
	add constraint fk_c_sc foreign key(Cno) references Course(Cno) on delete cascade
alter table TC with nocheck
	add constraint fk_t_tc foreign key(Tno) references Teacher(Tno) on delete cascade
alter table TC with nocheck
	add constraint fk_c_tc foreign key(Cno) references Course(Cno) on delete cascade

--姓名字段唯一
alter table Student
	add constraint unique_sna unique(Sname)
alter table Teacher
	add constraint unique_tna unique(Tname)
--性别设置
alter table Teacher with check
	add constraint check_t_sex check(Sex='男' or Sex='女')
alter table Teacher
	add constraint t_sex default '男' for Sex

alter table Student with check
	add constraint check_s_sex check(Sex='男' or Sex='女')
alter table Student
	add constraint s_sex default '男' for Sex

--年龄与分数限定
alter table Student with check
	add constraint check_s_age check(Age>15 and Age<45)
alter table Teacher with check
	add constraint check_t_age check(Age>15 and Age<100)
alter table SC with check
	add constraint check_t_score check(Score>=0 and Score<=100)

--Teacher表Sal字段约束
use School
alter table Teacher with check
	add constraint check_t_sal check(Sal>=4000 and Sal<=20000)
alter table Teacher
	add constraint t_dept default '计算机' for Dept
