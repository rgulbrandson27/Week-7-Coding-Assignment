DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project_category;

CREATE TABLE project (
project_id INT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7,2),
actual_hours DECIMAL(7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id) 
);

CREATE TABLE material (
material_id INT NOT NULL, 
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT, 
cost DECIMAL(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
step_id INT NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE category (
category_id INT NOT NULL, 
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

INSERT INTO category (category_name) VALUES ('Decor Projects');
INSERT INTO category (category_name) VALUES ('Painting Projects');
INSERT INTO category (category_name) VALUES ('Small Build Projects');

INSERT INTO material (project_id, material_name, num_required) VALUES (1, '1x3 4-foot wood piece', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'nails', 50);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'small saw', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'sand paper', 2);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'hammer', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'quart of paint', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'paintbrush', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'tape measure', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'cleaner cloth', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'medium paintbrush', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'dropcloth', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'quart of paint', 1);

INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'saw wood pieces according to specified lengths', 1);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'sand wood pieces until smooth', 2);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'frame pieces according to diagram and nail together', 3);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (1, 'add two coats of paint', 4);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'clean entire door surface thoroughly', 1);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'prepare for painting (add drop cloth, stir paint', 2);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'add one coat of paint and let dry', 3);
INSERT INTO STEP (project_id, step_text, step_order) VALUES (2, 'add second coat of paint', 4);

INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (2, 2);



