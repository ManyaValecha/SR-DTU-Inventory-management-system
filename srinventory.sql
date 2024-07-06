CREATE TABLE IF NOT EXISTS Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    sex TEXT CHECK(sex IN ('Male', 'Female')) NOT NULL,
    batch_position TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Projects (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_name TEXT NOT NULL,
    project_leader INTEGER,
    FOREIGN KEY (project_leader) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS ProjectMembers (
    project_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Items (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_class TEXT CHECK(item_class IN ('Consumable', 'Equipment', 'Industrial Infrastructure')) NOT NULL,
    item_name TEXT NOT NULL,
    storage_location TEXT NOT NULL,
    ownership TEXT NOT NULL,
    working_status TEXT CHECK(working_status IN ('Fully working', 'Partially working', 'Not working')) NOT NULL,
    problem_description TEXT,
    repairable TEXT CHECK(repairable IN ('Yes', 'No')) NOT NULL,
    usage_status TEXT,
    quantity INTEGER NOT NULL,
    image BLOB
);

CREATE TABLE IF NOT EXISTS Issues (
    issue_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INTEGER,
    user_id INTEGER,
    issue_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (name, sex, batch_position) VALUES
('Vihaan Sharma', 'Male', 'Batch A'),
('Shanaya Sinha', 'Female', 'Batch B'),


INSERT INTO Projects (project_name, project_leader) VALUES
('Project Alpha', 1),
('Project Beta', 2);

INSERT INTO ProjectMembers (project_id, user_id) VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO Items (item_class, item_name, storage_location, ownership, working_status, problem_description, repairable, usage_status, quantity, image) VALUES
('Equipment', 'Arduino', 'Cubicle 1', 'Lab A', 'Fully working', NULL, 'Yes', 'Project Alpha', 2, NULL),
('Equipment', 'Soldering Iron', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Alpha', 1, NULL),
('Equipment', 'Arduino UNO R3 Board', 'Cubicle 1', 'Lab A', 'Fully working', NULL, 'Yes', 'Project Alpha', 2, NULL),
('Equipment', 'Resistor Pack', 'Cubicle 3', 'Lab A', 'Not working', 'Resistors are broken', 'Yes', 'Project Alpha', 5, NULL),
('Equipment', '3D Printer', 'Cubicle 3', 'Lab B', 'Not working', 'Filament issue', 'Yes', 'Project Alpha', 1, NULL),
('Equipment', 'Led Pack', 'Cubicle 3', 'Lab A', 'Fully working', NULL, 'Yes', 'Project Alpha', 5, NULL),
('Equipment', '30A ESC Brushless Motor', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Beta', 0, NULL),
('Equipment', 'OpenMV Cam H7', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Beta', 0, NULL),
('Equipment', 'IR Sensor', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Beta', 0, NULL),
('Equipment', 'LIDAR-Lite v3', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Beta', 0, NULL),
('Equipment', 'L298N Dual Motor Driver', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Beta', 0, NULL),
('Equipment', 'Arduino Nano', 'Cubicle 2', 'Lab B', 'Fully working', NULL, 'Yes', 'Project Beta', 0, NULL);
('Equipment','Nozzles','Cubicle 4','Lab C','Fully working',NULL,'Yes',NULL,3,NULL);

INSERT INTO Issues (item_id, user_id, issue_date, expected_return_date) VALUES
(1, 1, '2024-07-01', '2024-07-10'),
(2, 2, '2024-07-02', '2024-07-15');
