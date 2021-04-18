-- Get topic by ID
select * from topics where id = 531;

-- Get topic path
select topics_level1.id, topics_level1.name, topics_level1.type,
       topics_level2.id, topics_level2.name, topics_level2.type,
       topics_level3.id, topics_level3.name, topics_level3.type
from topics as topics_level3
    left join topics as topics_level2 on topics_level2.id = topics_level3.parent_id
    left join topics as topics_level1 on topics_level1.id = topics_level2.parent_id
where topics_level3.id = 610;

-- Get child of a topic (category/sub-category)
select * from topics where parent_id = 123 order by score desc;

-- Get category hierarchy, for all categories get top `k` sub categories
select t1_id, t1_name, t2_id, t2_name, t2_score from (
    SELECT topics1.id as t1_id,
           topics1.name as t1_name,
           topics2.id as t2_id,
           topics2.name as t2_name,
           topics2.score as t2_score,
           ROW_NUMBER() over (partition by topics1.id) row_num
    FROM topics AS topics1
        LEFT JOIN topics AS topics2 ON topics1.id = topics2.parent_id
    WHERE topics1.type = 1 and topics2.type = 2
    ORDER BY topics1.score DESC, topics2.score DESC, topics1.id, topics2.id
) t WHERE row_num <= 10;
