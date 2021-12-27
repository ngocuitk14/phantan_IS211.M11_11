-- Tạo keyspace
CREATE KEYSPACE IF NOT EXISTS DEMO WITH REPLICATION = 

-- Xem thông tin keyspace
select * from system_schema.keyspace

-- Update keyspace
Alter Keyspace DEMO with replication={'class':'NetworkTopologyStrategy', 'datacenter1': 2};

-- delete keyspace
Drop keyspace DEMO

-- Sử dụng keyspace
use DEMO

-- Tạo table
create table student (
  id int PRIMARY KEY,
  studentName text,
  class text
);

-- update table
alter table student add age int;

-- delete table
Drop Table DEMO.student

-- insert data
insert into student(id, studentName, class, age) values (1, 'Nguyen Huy Hoang', 'HTTT2019', 20);
insert into student(id, studentName, class, age) values (2, 'Truong Nguyen Ngoc', 'HTTT2019', 20);
insert into student(id, studentName, class, age) values (3, 'Pham Ho Luong', 'HTTT2019', 20);
insert into student(id, studentName, class, age) values (4, 'Phan Tran Khanh Hung', 'HTTT2019', 20);

-- update data
update student
  set age = 21
  where id = 1

-- delete data
delete from student where id = 1;

-- delete tất cả dữ liệu trong table
Truncate student

-- select data
select * from student where id = 1;
-- câu lệch select chỉ hoạt động nếu mệnh đề where chỉ gồm các khóa. Các câu lệnh sau sẽ không hoạt động
select * from student where id = 1 and studentName = 'Nguyen Huy Hoang';
select * from student where studentName = 'Nguyen Huy Hoang';

-- Cần tạo index cho các cột khác để sử dụng nó trong mệnh đề where
-- Tạo index cho maSach
create index studentNameIndex on student(studentName);
-- Các câu select bên dưới sẽ hoạt động
select * from student where id = 1 and studentName = 'Nguyen Huy Hoang';
select * from student where studentName = 'Nguyen Huy Hoang';

-- cassandra time to live: 1 loại data sẽ tự động bị xóa khỏi table theo thời gian định sẵn
insert into student(id, studentName, class, age) values (5, 'Nguyen Van A', 'HTTT2019', 21)
  using ttl 30;
-- student 5 sẽ tự động bị xóa khỏi bảng sách sau 30s

