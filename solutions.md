## task 1
<pre>      Student       |      Mentor      | Student’s city | Mentor’s city 
--------------------+------------------+----------------+---------------
 Aimaar Abdul       | Peter Smith      | Chicago        | New York
 Alex Anjou         | Julius Maxim     | Paris          | Berlin
 Christian Blanc    | Melinda O&apos;Connor | Paris          | Berlin
 Dolores Perez      | Laura Wild       | Barcelona      | Chicago
 Gerald Hutticher   | Julia Vila       | Berlin         | Barcelona
 Gudrun Schmidt     | Patricia Boulard | Berlin         | Marseille
 Irmgard Seekircher | Fabienne Martin  | Berlin         | Paris
 Itzi Elizabal      | Melinda O&apos;Connor | Barcelona      | Berlin
 John Goldwin       | Julia Vila       | Chicago        | Barcelona
 Maria Highsmith    | Julius Maxim     | New York       | Berlin
(10 rows)</pre>
## task 2
<pre>student_mentor=# SELECT                                                                                                            s.name AS &quot;Student&quot;,
    m.name AS &quot;Mentor&quot;,
    s.city AS &quot;Student’s city&quot;,                                                                                                    m.city AS &quot;Mentor’s city&quot;
FROM
    student s                                                            
left JOIN                                    
    mentor m ON s.mentor_id = m.id
ORDER BY                                      
    s.name;
      Student       |      Mentor      | Student’s city | Mentor’s city 
--------------------+------------------+----------------+---------------
 Aimaar Abdul       | Peter Smith      | Chicago        | New York
 Alex Anjou         | Julius Maxim     | Paris          | Berlin
 Christian Blanc    | Melinda O&apos;Connor | Paris          | Berlin
 Dolores Perez      | Laura Wild       | Barcelona      | Chicago
 Emilio Ramiro      |                  | Barcelona      | 
 Gerald Hutticher   | Julia Vila       | Berlin         | Barcelona
 Gudrun Schmidt     | Patricia Boulard | Berlin         | Marseille
 Irmgard Seekircher | Fabienne Martin  | Berlin         | Paris
 Itzi Elizabal      | Melinda O&apos;Connor | Barcelona      | Berlin
 John Goldwin       | Julia Vila       | Chicago        | Barcelona
 Maria Highsmith    | Julius Maxim     | New York       | Berlin
 Wayne Green        |                  | New York       | 
(12 rows)
</pre>
## task 3
<pre>student_mentor=# SELECT
    m.name AS &quot;Mentor&quot;,
    s.name AS &quot;Student&quot;,
    m.city AS &quot;Mentor’s city&quot;,
    COALESCE(s.city, &apos;&apos;) AS &quot;Student’s city&quot;
FROM
    mentor m, student s
WHERE
    s.mentor_id = m.id

UNION ALL

SELECT
    m.name AS &quot;Mentor&quot;,
    &apos;&apos; AS &quot;Student&quot;,
    m.city AS &quot;Mentor’s city&quot;,
    &apos;&apos; AS &quot;Student’s city&quot;
FROM
    mentor m
WHERE
    NOT EXISTS (SELECT 1 FROM student s WHERE s.mentor_id = m.id)
ORDER BY
    &quot;Mentor&quot;, &quot;Student&quot;;
      Mentor      |      Student       | Mentor’s city | Student’s city 
------------------+--------------------+---------------+----------------
 Ahmed Ali        |                    | Marseille     | 
 Fabienne Martin  | Irmgard Seekircher | Paris         | Berlin
 Julia Vila       | Gerald Hutticher   | Barcelona     | Berlin
 Julia Vila       | John Goldwin       | Barcelona     | Chicago
 Julius Maxim     | Alex Anjou         | Berlin        | Paris
 Julius Maxim     | Maria Highsmith    | Berlin        | New York
 Laura Wild       | Dolores Perez      | Chicago       | Barcelona
 Melinda O&apos;Connor | Christian Blanc    | Berlin        | Paris
 Melinda O&apos;Connor | Itzi Elizabal      | Berlin        | Barcelona
 Patricia Boulard | Gudrun Schmidt     | Marseille     | Berlin
 Peter Smith      | Aimaar Abdul       | New York      | Chicago
 Rose Dupond      |                    | Brussels      | 
(12 rows)
</pre>
## task 4
<pre>student_mentor=# SELECT
    m.name AS &quot;Mentor&quot;,
    COALESCE(s.name, &apos;&apos;) AS &quot;Student&quot;,
    m.city AS &quot;Mentor’s city&quot;,
    COALESCE(s.city, &apos;&apos;) AS &quot;Student’s city&quot;
FROM
    mentor m
LEFT JOIN
    student s ON m.id = s.mentor_id
WHERE
    m.city = &apos;Berlin&apos; OR COALESCE(s.city, &apos;&apos;) = &apos;Berlin&apos;
ORDER BY
    m.name, s.name;
      Mentor      |      Student       | Mentor’s city | Student’s city 
------------------+--------------------+---------------+----------------
 Fabienne Martin  | Irmgard Seekircher | Paris         | Berlin
 Julia Vila       | Gerald Hutticher   | Barcelona     | Berlin
 Julius Maxim     | Alex Anjou         | Berlin        | Paris
 Julius Maxim     | Maria Highsmith    | Berlin        | New York
 Melinda O&apos;Connor | Christian Blanc    | Berlin        | Paris
 Melinda O&apos;Connor | Itzi Elizabal      | Berlin        | Barcelona
 Patricia Boulard | Gudrun Schmidt     | Marseille     | Berlin
(7 rows)
</pre>
## task 5
<pre>student_mentor=# SELECT
    s.name AS &quot;Student&quot;,
    s.city AS &quot;City&quot;,
    m.name AS &quot;Mentor&quot;
FROM
    student s
JOIN
    mentor m ON s.city = m.city
ORDER BY
    s.city, s.name, m.name;
      Student       |   City    |      Mentor      
--------------------+-----------+------------------
 Dolores Perez      | Barcelona | Julia Vila
 Emilio Ramiro      | Barcelona | Julia Vila
 Itzi Elizabal      | Barcelona | Julia Vila
 Gerald Hutticher   | Berlin    | Julius Maxim
 Gerald Hutticher   | Berlin    | Melinda O&apos;Connor
 Gudrun Schmidt     | Berlin    | Julius Maxim
 Gudrun Schmidt     | Berlin    | Melinda O&apos;Connor
 Irmgard Seekircher | Berlin    | Julius Maxim
 Irmgard Seekircher | Berlin    | Melinda O&apos;Connor
 Aimaar Abdul       | Chicago   | Laura Wild
 John Goldwin       | Chicago   | Laura Wild
 Maria Highsmith    | New York  | Peter Smith
 Wayne Green        | New York  | Peter Smith
 Alex Anjou         | Paris     | Fabienne Martin
 Christian Blanc    | Paris     | Fabienne Martin
(15 rows)
</pre>
## task 6
<pre>student_mentor=# SELECT * FROM student
ORDER BY name;
 id |        name        |   city    | mentor_id | local_mentor 
----+--------------------+-----------+-----------+--------------
  3 | Aimaar Abdul       | Chicago   |         1 |            2
  9 | Alex Anjou         | Paris     |         3 |            7
  8 | Christian Blanc    | Paris     |         4 |            7
  1 | Dolores Perez      | Barcelona |         2 |            6
 11 | Emilio Ramiro      | Barcelona |           |            6
  5 | Gerald Hutticher   | Berlin    |         6 |            3
  4 | Gudrun Schmidt     | Berlin    |         5 |            3
  7 | Irmgard Seekircher | Berlin    |         7 |            3
  6 | Itzi Elizabal      | Barcelona |         4 |            6
 10 | John Goldwin       | Chicago   |         6 |            2
  2 | Maria Highsmith    | New York  |         3 |            1
 12 | Wayne Green        | New York  |           |            1
(12 rows)
</pre>
# The End!