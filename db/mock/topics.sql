-- inserting categories
INSERT INTO topics (name, parent_id, type)
SELECT CONCAT("cat-", id), NULL, 1 FROM (
    SELECT id from counters LIMIT 50
) t;

-- inserting sub-categories
INSERT INTO topics (name, parent_id, type)
SELECT CONCAT("subcat-", category_id, counter_id), category_id, 2 FROM (
    SELECT categories.id as category_id, counters.id as counter_id FROM (
        (SELECT id from topics where type = 1) categories,
        (SELECT id from counters LIMIT 100) counters
    )
) t;

-- inserting topics
INSERT INTO topics (name, parent_id, type)
SELECT CONCAT("topic-", subcategory_id, counter_id), subcategory_id, 3 FROM (
    SELECT subcategories.id as subcategory_id, counters.id as counter_id FROM (
        (SELECT id from topics where type = 2) subcategories,
        (SELECT id from counters LIMIT 1000) counters
    )
) t;

UPDATE topics SET score = RAND();
