SELECT gender as Gender,
COUNT(gender) as Count,
COUNT(gender) / (SELECT COUNT(gender) FROM mydb.mytbl_gender)*100 as Percent FROM mydb.mytbl_gender
GROUP BY gender;
# +--------+-------+---------+
# | Gender | Count | Percent |
# +--------+-------+---------+
# | M      |     1 | 14.2857 |
# | W      |     6 | 85.7143 |
# +--------+-------+---------+


SELECT gender as Gender,
COUNT(gender) as Count,
SUBSTR(count(gender) / (SELECT COUNT(gender) FROM mydb.mytbl_gender)*100 ,1,5) as Percent FROM mydb.mytbl_gender
GROUP BY gender;
# +--------+-------+---------+
# | Gender | Count | Percent |
# +--------+-------+---------+
# | M      |     1 | 14.28   |
# | W      |     6 | 85.71   |
# +--------+-------+---------+


SELECT gender as Gender,
COUNT(gender) as Count,
CAST((count(gender) / (SELECT COUNT(gender) FROM mydb.mytbl_gender)*100) as DECIMAL(9,2)) as Percent FROM mydb.mytbl_gender
GROUP BY gender;
# +--------+-------+---------+
# | Gender | Count | Percent |
# +--------+-------+---------+
# | M      |     1 |   14.29 |
# | W      |     6 |   85.71 |
# +--------+-------+---------+


SELECT gender as Gender,
COUNT(gender) as Count,
ROUND((count(gender) / (SELECT COUNT(gender) FROM mydb.mytbl_gender)*100),2) as Percent FROM mydb.mytbl_gender
GROUP BY gender;
# +--------+-------+---------+
# | Gender | Count | Percent |
# +--------+-------+---------+
# | M      |     1 |   14.29 |
# | W      |     6 |   85.71 |
# +--------+-------+---------+


CREATE VIEW view_gender as
SELECT gender as 'Gender',
COUNT(gender) as Count,
ROUND((count(gender) / (SELECT COUNT(gender) FROM mytbl_gender)*100),2) as Percent FROM mytbl_gender
GROUP BY Gender ORDER BY Count ASC;

SELECT * FROM view_gender;
# +--------+-------+---------+
# | Gender | Count | Percent |
# +--------+-------+---------+
# | M      |     1 |   14.29 |
# | W      |     6 |   85.71 |
# +--------+-------+---------+

