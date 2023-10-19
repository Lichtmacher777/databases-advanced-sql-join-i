-- Task 6

ALTER TABLE student ADD COLUMN local_mentor integer;
ALTER TABLE student ADD CONSTRAINT student_local_mentor_fkey FOREIGN KEY (local_mentor) REFERENCES mentor(id);
