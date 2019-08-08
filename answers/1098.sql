SELECT b.book_id, b.name
FROM Books b
WHERE
    b.available_from < '2019-05-23'
    AND
    10 > 
    IFNULL(
        (
            SELECT SUM(o.quantity)
            FROM Orders o
            WHERE 
                o.book_id = b.book_id 
                AND 
                dispatch_date > '2018-06-23'
        )
    , 0)