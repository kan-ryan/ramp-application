SELECT
    date_table.transaction_date AS date,
    (SELECT SUM(t.transaction_amount) / 3
     FROM transactions t
     WHERE DATE(t.transaction_time) BETWEEN DATE_SUB(date_table.transaction_date, INTERVAL 2 DAY) AND date_table.transaction_date) AS rolling_3_day_avg
FROM
    (SELECT DISTINCT DATE(transaction_time) AS transaction_date
     FROM transactions) AS date_table
WHERE
    date_table.transaction_date = '2021-01-31';
