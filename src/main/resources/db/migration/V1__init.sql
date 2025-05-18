CREATE TABLE teachers (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         title VARCHAR(100) NOT NULL,
                         teacher_id INT NOT NULL,
                         CONSTRAINT fk_teacher
                             FOREIGN KEY (teacher_id)
                                 REFERENCES teachers(id)
                                 ON DELETE CASCADE
);
