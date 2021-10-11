USE mydb;

SELECT drug1,drug2,drug3,drug4,drug5 FROM mytbl_drugs ORDER BY drug1 ASC;
-- +---------------+-----------------+-----------------+-------------+---------------+
-- | drug1         | drug2           | drug3           | drug4       | drug5         |
-- +---------------+-----------------+-----------------+-------------+---------------+
-- | AAS           | amoxicillin     | adalimumab      |             |               |
-- | AAS           | metamizole      |                 |             |               |
-- | AAS           | paracetamol     | amiodarone      |             |               |
-- | acenocoumarol | levomepromazine | metamizole      |             |               |
-- | acenocoumarol | tacrolimus      |                 |             |               |
-- | adalimumab    | rituximab       |                 |             |               |
-- | amiodarone    | tacrolimus      | enoxaparin      | paracetamol | ceftriaxone   |
-- | amoxicillin   | adalimumab      | levofloxacin    | AAS         | ceftriaxone   |
-- | amoxicillin   |                 |                 |             |               |
-- | amoxicillin   | AAS             | vancomycin      |             |               |
-- | amoxicillin   | AAS             |                 |             |               |
-- | amoxicillin   | levomepromazine | tacrolimus      | iomeprol    | ciprofloxacin |
-- | amoxicillin   | adalimumab      |                 |             |               |
-- | amoxicillin   | paracetamol     |                 |             |               |
-- | ceftriaxone   | amiodarone      |                 |             |               |
-- | ceftriaxone   | iomeprol        | levomepromazine | amiodarone  | levofloxacin  |
-- | ceftriaxone   |                 |                 |             |               |
-- | ciprofloxacin | mepivacaine     |                 |             |               |
-- | ciprofloxacin | AAS             | enoxaparin      |             |               |
-- | enoxaparin    | adalimumab      | mepivacaine     |             |               |
-- | enoxaparin    | rituximab       | paracetamol     |             |               |
-- | enoxaparin    | ceftriaxone     |                 |             |               |
-- | metamizole    | AAS             |                 |             |               |
-- | metamizole    |                 |                 |             |               |
-- | metamizole    | AAS             |                 |             |               |
-- +---------------+-----------------+-----------------+-------------+---------------+

SELECT COUNT(DISTINCT drug1) AS "DISTINCT Drug1",
  COUNT(DISTINCT drug2)-1 AS "DISTINCT Drug2",
  COUNT(DISTINCT drug3)-1 AS "DISTINCT Drug3",
  COUNT(DISTINCT drug4)-1 AS "DISTINCT Drug4",
  COUNT(DISTINCT drug5)-1 AS "DISTINCT Drug5"
  FROM mytbl_drugs ; 
-- +---------------------+---------------------+---------------------+---------------------+---------------------+
-- | DISTINCT Drug2 rows | DISTINCT Drug2 rows | DISTINCT Drug3 rows | DISTINCT Drug4 rows | DISTINCT Drug5 rows |
-- +---------------------+---------------------+---------------------+---------------------+---------------------+
-- |                   9 |                  12 |                  10 |                   4 |                   3 |
-- +---------------------+---------------------+---------------------+---------------------+---------------------+



SELECT COUNT(DISTINCT drug2) AS "DISTINCT Drug2"
  FROM mytbl_drugs WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL;
-- +----------------+
-- | DISTINCT Drug2 |
-- +----------------+
-- |             12 |
-- +----------------+


SELECT COUNT(drug2) AS "TOTAL Drug2" FROM mytbl_drugs WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL;
-- +-------------+
-- | TOTAL Drug2 |
-- +-------------+
-- |          22 |
-- +-------------+

SELECT COUNT(DISTINCT drug1) AS "DISTINCT Drug1",
  COUNT(drug1) AS "TOTAL Drug1" FROM mytbl_drugs
  WHERE drug1 NOT LIKE "" AND drug1 IS NOT NULL;
-- +----------------+-------------+
-- | DISTINCT Drug1 | TOTAL Drug1 |
-- +----------------+-------------+
-- |             9 |          25 |
-- +----------------+-------------+


SELECT COUNT(DISTINCT drug2) AS "DISTINCT Drug2",
  COUNT(drug2) AS "TOTAL Drug2" FROM mytbl_drugs
  WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL;
-- +----------------+-------------+
-- | DISTINCT Drug2 | TOTAL Drug2 |
-- +----------------+-------------+
-- |             12 |          22 |
-- +----------------+-------------+


SELECT COUNT(DISTINCT drug3) AS "DISTINCT Drug3",
  COUNT(drug3) AS "TOTAL Drug3" FROM mytbl_drugs
  WHERE drug3 NOT LIKE "" AND drug3 IS NOT NULL;
-- +----------------+-------------+
-- | DISTINCT Drug3 | TOTAL Drug3 |
-- +----------------+-------------+
-- |             10 |          11 |
-- +----------------+-------------+
  
  
SELECT COUNT(DISTINCT drug4) AS "DISTINCT Drug4",
  COUNT(drug4) AS "TOTAL Drug4" FROM mytbl_drugs
  WHERE drug4 NOT LIKE "" AND drug4 IS NOT NULL;
-- +----------------+-------------+
-- | DISTINCT Drug4 | TOTAL Drug4 |
-- +----------------+-------------+
-- |             4 |          4   |
-- +----------------+-------------+


SELECT COUNT(DISTINCT drug5) AS "DISTINCT Drug5",
  COUNT(drug5) AS "TOTAL Drug5" FROM mytbl_drugs
  WHERE drug5 NOT LIKE "" AND drug5 IS NOT NULL;
-- +----------------+-------------+
-- | DISTINCT Drug5 | TOTAL Drug5 |
-- +----------------+-------------+
-- |              3 |           4 |
-- +----------------+-------------+


SELECT COUNT(DISTINCT drug1) AS "DISTINCT (minim 2 drugs) Drug1",
  COUNT(DISTINCT drug2) AS "Drug2"
  FROM mytbl_drugs
  WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL;
-- +--------------------------------+-------+
-- | DISTINCT (minim 2 drugs) Drug1 | Drug2 |
-- +--------------------------------+-------+
-- |                              9 |    12 |
-- +--------------------------------+-------+


SELECT drug2 as Drug2,
  COUNT(*) as n,
  ROUND(count(*) / (SELECT COUNT(*) FROM mytbl_drugs)*100 ,2) as "  %"
  FROM mytbl_drugs WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL
  GROUP BY drug2 ORDER BY COUNT(*) DESC LIMIT 5;
-- +-----------------+---+-------+
-- | Drug2           | n | %     |
-- +-----------------+---+-------+
-- | AAS             | 5 | 20.00 |
-- | adalimumab      | 3 | 12.00 |
-- | levomepromazine | 2 |  8.00 |
-- | tacrolimus      | 2 |  8.00 |
-- | rituximab       | 2 |  8.00 |
-- +-----------------+---+-------+


SELECT drug2 as Drug2,
  COUNT(*) as n
  FROM mytbl_drugs WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL
  GROUP BY drug2 ORDER BY COUNT(*) DESC LIMIT 5;
-- +-----------------+---+
-- | Drug2           | n |
-- +-----------------+---+
-- | AAS             | 3 |
-- | adalimumab      | 3 |
-- | metamizole      | 2 |
-- | levomepromazine | 2 |
-- | tacrolimus      | 2 |
-- +-----------------+---+


SELECT DISTINCT drug1 as Drug1, drug2 as Drug2,
  COUNT(*) as n
  FROM mytbl_drugs WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL
  GROUP BY drug1,drug2 ORDER BY COUNT(*) DESC LIMIT 5;  
-- +---------------+-----------------+---+
-- | Drug1         | Drug2           | n |
-- +---------------+-----------------+---+
-- | amoxicillin   | AAS             | 2 |
-- | metamizole    | AAS             | 2 |
-- | amoxicillin   | adalimumab      | 2 |
-- | acenocoumarol | levomepromazine | 1 |
-- | enoxaparin    | adalimumab      | 1 |
-- +---------------+-----------------+---+


SELECT drug1 as "Drug1 with drug2 true",
    COUNT(*) as n,
    ROUND(count(*) / (SELECT COUNT(*) FROM mytbl_drugs)*100 ,2) as "%"
    FROM mytbl_drugs WHERE drug2 NOT LIKE "" AND drug2 IS NOT NULL
    GROUP BY drug1 ORDER BY COUNT(*) DESC LIMIT 5;
-- +-----------------------+---+-------+
-- | Drug1 with drug2 true | n | %     |
-- +-----------------------+---+-------+
-- | amoxicillin           | 6 | 24.00 |
-- | AAS                   | 3 | 12.00 |
-- | enoxaparin            | 3 | 12.00 |
-- | acenocoumarol         | 2 |  8.00 |
-- | ceftriaxone           | 2 |  8.00 |
-- +-----------------------+---+-------+


SELECT drug1 as "Drug1 with drug2 false",
  COUNT(*) as n,
  ROUND(count(*) / (SELECT COUNT(*) FROM mytbl_drugs)*100 ,2) as "%"
  FROM mytbl_drugs WHERE drug2 like "" OR drug2 IS NULL
  GROUP BY drug1 ORDER BY COUNT(*) DESC LIMIT 5;
-- +------------------------+---+------+
-- | Drug1 with drug2 false | n | %    |
-- +------------------------+---+------+
-- | amoxicillin            | 1 | 4.00 |
-- | ceftriaxone            | 1 | 4.00 |
-- | metamizole             | 1 | 4.00 |
-- +------------------------+---+------+


SELECT CONCAT(drug1, " | ",drug2, " | ", drug3, " | ", drug4, " | ", drug5) AS Alldrugs,
   COUNT(CONCAT(drug1, " | ",drug2, " | ", drug3, " | ", drug4, " | ", drug5)) AS n
   FROM mytbl_drugs
   GROUP BY drug1,drug2,drug3,drug4,drug5 ORDER BY n DESC;
-- +----------------------------------------------------+---+
-- | Alldrugs                                           | n |
-- +----------------------------------------------------+---+
-- | metamizole | AAS |  |  |                           | 2 |
-- | acenocoumarol | levomepromazine | metamizole |  |  | 1 |
-- | enoxaparin  | adalimumab | mepivacaine |  |        | 1 |
-- | enoxaparin | rituximab | paracetamol |  |          | 1 |
-- | AAS | amoxicillin | adalimumab |  |                | 1 |
-- +----------------------------------------------------+---+
