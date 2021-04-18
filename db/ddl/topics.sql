-- Create table topics
create table if not exists topics (
    id int primary key auto_increment,
    name varchar(256),
    parent_id int null,
    type smallint not null,
    score float default 0,
    foreign key (parent_id) references topics(id)
);

-- Index on (type)
alter table topics add index type(type);

-- Index on (parent_id, score)
alter table topics add index parent_id_score(parent_id, score);
