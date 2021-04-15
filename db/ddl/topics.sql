-- Create table topics
create table if not exists topics (
    id int primary key auto_increment,
    name varchar(256),
    parent_id int null,
    type smallint not null,
    foreign key (parent_id) references topics(id),
    index(type)
);
