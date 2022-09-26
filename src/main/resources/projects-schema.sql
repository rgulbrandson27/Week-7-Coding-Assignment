USE PROJECTS;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7,2),
actual_hours DECIMAL(7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id) 
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL, 
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT, 
cost DECIMAL(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE category (
category_id INT AUTO_INCREMENT NOT NULL, 
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
project_id INT, 
category_id INT,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Build Shelf for IKEA Teacups', 3, 4, 3, 'bring teacup to store');
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Paint Door', 2, 3, 2, 'save paint for touch ups');

INSERT INTO category (category_name) VALUES ('Decor Projects');
INSERT INTO category (category_name) VALUES ('Painting Projects');
INSERT INTO category (category_name) VALUES ('Small Build Projects');

INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, '1x3 4-foot wood piece', 1, 20.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'nails', 50, 4.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'small saw', 1, 15.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'sand paper', 2, 2.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'hammer', 1, 0.00	);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'quart of paint', 1, 10.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'paintbrush', 1, 5.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'tape measure', 1, 0.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'cleaner cloth', 1, 0.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'medium paintbrush', 1, 8.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'dropcloth', 1, 0.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'quart of paint', 1, 10.00);

INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'saw wood pieces according to specified lengths', 1);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'sand wood pieces until smooth', 2);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'frame pieces according to diagram and nail together', 3);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'add two coats of paint', 4);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'clean entire door surface thoroughly', 1);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'prepare for painting (add drop cloth, stir paint', 2);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'add one coat of paint and let dry', 3);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'add second coat of paint', 4);


SELECT * FROM PROJECT;


