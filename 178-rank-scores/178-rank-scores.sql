/* Write your PL/SQL query statement below */
SELECT SCORE "score", DENSE_RANK() OVER (ORDER BY SCORE DESC) "rank"
FROM SCORES 