# Advanced SQL - JOIN operations

## Description

In this exercises, we will practice basic joining operations of multiple tables to match, filter and update records.

##

## Tasks

###

### Task 1


Create a new database and execute the file [src/data/task1.sql](src/data/task1.sql) to load the initial data required for this exercise.

This file has the following two tables and some test data on each of them:

1. Student
1. Mentor

Both tables have the same fields: `id` (as a `serial`), `name` (as a `varchar`) and `city` (also as a `varchar`). The `student` table also has a field named `mentor_id` as a foreign key to the table `mentor`.

Your task is to **match every student with its mentor**, showing the following fields:

1. Student's name
2. Mentor's name
1. Student's city
2. Mentor's city

- Your result should be **sorted by student's name** and should look like this:

| Student            | Mentor           | Student’s city | Mentor’s city |
|--------------------|------------------|----------------|---------------|
| Aimaar Abdul       | Peter Smith      | Chicago        | New York      |
| Alex Anjou         | Julius Maxim     | Paris          | Berlin        |
| Christian Blanc    | Melinda O'Connor | Paris          | Berlin        |
| Dolores Perez      | Laura Wild       | Barcelona      | Chicago       |
| Gerald Hutticher   | Julia Vila       | Berlin         | Barcelona     |
| Gudrun Schmidt     | Patricia Boulard | Berlin         | Marseille     |
| Irmgard Seekircher | Fabienne Martin  | Berlin         | Paris         |
| Itzi Elizabal      | Melinda O'Connor | Barcelona      | Berlin        |
| John Goldwin       | Julia Vila       | Chicago        | Barcelona     |
| Maria Highsmith    | Julius Maxim     | New York       | Berlin        |


### Task 2

Keep the data from the previous task and execute the file [src/data/task2.sql](src/data/task2.sql) to add some more students to our database.

These students are new and don't have a mentor, yet. Now, produce the same list as before but this time it should also show the new students, with a `null` value if they don't have a mentor assigned.

- Your result should be **sorted by student's name** and should look like this:

| Student            | Mentor           | Student’s city | Mentor’s city |
|--------------------|------------------|----------------|---------------|
| Aimaar Abdul       | Peter Smith      | Chicago        | New York      |
| Alex Anjou         | Julius Maxim     | Paris          | Berlin        |
| Christian Blanc    | Melinda O'Connor | Paris          | Berlin        |
| Dolores Perez      | Laura Wild       | Barcelona      | Chicago       |
| Emilio Ramiro      |                  | Barcelona      |               |
| Gerald Hutticher   | Julia Vila       | Berlin         | Barcelona     |
| Gudrun Schmidt     | Patricia Boulard | Berlin         | Marseille     |
| Irmgard Seekircher | Fabienne Martin  | Berlin         | Paris         |
| Itzi Elizabal      | Melinda O'Connor | Barcelona      | Berlin        |
| John Goldwin       | Julia Vila       | Chicago        | Barcelona     |
| Maria Highsmith    | Julius Maxim     | New York       | Berlin        |
| Wayne Green        |                  | New York       |               |


### Task 3

Keep the data from the previous tasks and execute the file [src/data/task3.sql](src/data/task3.sql) to add some more mentors to our database.

Now produce **a list of mentors with their students** assigned (a mentor will have as many records as students it is assigned to). Mentors with no student should also appear in the list with null values.

> You are **not allowed** to use a **LEFT JOIN** in your statement.

> Change the order of the fields to: Mentor, Student, Mentor's city, Student's city.

- Your result should be **sorted by mentor's name** and should look like this:

| Mentor           | Student            | Mentor’s city | Student’s city |
|------------------|--------------------|---------------|----------------|
| Ahmed Ali        |                    | Marseille     |                |
| Fabienne Martin  | Irmgard Seekircher | Paris         | Berlin         |
| Julia Vila       | John Goldwin       | Barcelona     | Chicago        |
| Julia Vila       | Gerald Hutticher   | Barcelona     | Berlin         |
| Julius Maxim     | Alex Anjou         | Berlin        | Paris          |
| Julius Maxim     | Maria Highsmith    | Berlin        | New York       |
| Laura Wild       | Dolores Perez      | Chicago       | Barcelona      |
| Melinda O'Connor | Christian Blanc    | Berlin        | Paris          |
| Melinda O'Connor | Itzi Elizabal      | Berlin        | Barcelona      |
| Patricia Boulard | Gudrun Schmidt     | Marseille     | Berlin         |
| Peter Smith      | Aimaar Abdul       | New York      | Chicago        |
| Rose Dupond      |                    | Brussels      |                |


### Task 4

With the data from the previous task, produce a list of mentors (and their students) who are related to Berlin (either they live in Berlin or their students do).

- Your result should be **sorted by mentor's name** and should look like this:

| Mentor           | Student            | Mentor’s city | Student’s city |
|------------------|--------------------|---------------|----------------|
| Fabienne Martin  | Irmgard Seekircher | Paris         | Berlin         |
| Julia Vila       | Gerald Hutticher   | Barcelona     | Berlin         |
| Julius Maxim     | Alex Anjou         | Berlin        | Paris          |
| Julius Maxim     | Maria Highsmith    | Berlin        | New York       |
| Melinda O'Connor | Christian Blanc    | Berlin        | Paris          |
| Melinda O'Connor | Itzi Elizabal      | Berlin        | Barcelona      |
| Patricia Boulard | Gudrun Schmidt     | Marseille     | Berlin         |

### Task 5

It has been noted that none of the students has a mentor assigned of their same city. It is considered optimal if they live in the same city, so your task is to produce a list of students and their optimal mentors with the following fields:

- **Student**. The name of the student.
- **City**. The city of the student. *It will be the same as the mentor*.
- **Mentor**. The name of the mentor.

> If there is more than one mentor in a student's city, they will appear in two different records and repeating both the student's name and city.

- Your result should be **sorted by student's city** first, then **by student's name** and, finally, **by mentor's name** and should look like this:

| Student            | City      | Mentor           |
|--------------------|-----------|------------------|
| Dolores Perez      | Barcelona | Julia Vila       |
| Emilio Ramiro      | Barcelona | Julia Vila       |
| Itzi Elizabal      | Barcelona | Julia Vila       |
| Gerald Hutticher   | Berlin    | Julius Maxim     |
| Gerald Hutticher   | Berlin    | Melinda O'Connor |
| Gudrun Schmidt     | Berlin    | Julius Maxim     |
| Gudrun Schmidt     | Berlin    | Melinda O'Connor |
| Irmgard Seekircher | Berlin    | Julius Maxim     |
| Irmgard Seekircher | Berlin    | Melinda O'Connor |
| Aimaar Abdul       | Chicago   | Laura Wild       |
| John Goldwin       | Chicago   | Laura Wild       |
| Maria Highsmith    | New York  | Peter Smith      |
| Wayne Green        | New York  | Peter Smith      |
| Alex Anjou         | Paris     | Fabienne Martin  |
| Christian Blanc    | Paris     | Fabienne Martin  |

### Task 6

Now execute the contents of the file [src/data/task6.sql](src/data/task6.sql). This will create a new field named `local_mentor` in the `student` table as a foreign key to the field `id` of the table `mentor`.

Your task is to define an UPDATE statement to set the `local_mentor` field of each student to the id of any mentor who lives in the same city as the student.

> Use an implicit join (`FROM ... WHERE ...` instead of `JOIN ... ON ...`) for this task.

- After executing the `UPDATE` create a simple `SELECT` statement to check the `student` table. It should look similar to this (sorted by name):

| id | name               | city      | mentor_id | local_mentor |
|----|--------------------|-----------|-----------|--------------|
| 3  | Aimaar Abdul       | Chicago   | 1         | 2            |
| 9  | Alex Anjou         | Paris     | 3         | 7            |
| 8  | Christian Blanc    | Paris     | 4         | 7            |
| 1  | Dolores Perez      | Barcelona | 2         | 6            |
| 11 | Emilio Ramiro      | Barcelona |           | 6            |
| 5  | Gerald Hutticher   | Berlin    | 6         | 3            |
| 4  | Gudrun Schmidt     | Berlin    | 5         | 3            |
| 7  | Irmgard Seekircher | Berlin    | 7         | 3            |
| 6  | Itzi Elizabal      | Barcelona | 4         | 6            |
| 10 | John Goldwin       | Chicago   | 6         | 2            |
| 2  | Maria Highsmith    | New York  | 3         | 1            |
| 12 | Wayne Green        | New York  |           | 1            |
