/*Populate database with sample data. */

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-2-3', 0, true, 10.23),
 ('Gabumon', '2018-11-15', 2, true, 8.0),
 ('Pikachu', '2021-1-7', 1, false, 15.04),
 ('Devimon', '2017-5-12', 5, true, 11.0);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '02-08-2020', 0, false, -11.0),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12-', 1, true, -45.0);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17.0),
('Ditto', '2022-05-14', 4, true, 22.0);

-- Insert into owners tables
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77),
('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
	VALUES('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-4'), ('Jack Harkness', 38, '2008-06-8');

INSERT INTO specializations(vets_id, species_id) 
VALUES (1,1),(3,1),(3,2),(4,2);


INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES (1,1,'2020-05-24'), (1,3,'2020-07-22'), (2,4,'2021-02-2'),
  (3,2,'2020-01-5'), (3,2,'2020-03-8'), (3,2,'2020-05-14'), 
  (4,3,'2021-05-4'), (5,4,'2021-02-24'), (6,2,'2019-12-21');

INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,1,'2020-08-10'), (6,2,'2021-04-7'), (7,3,'2019-09-29'),
  (8,4,'2020-10-3'), (8,4,'2020-11-4'), (9,2,'2019-01-24'),
  (9,2,'2019-05-15'), (9,2,'2020-02-27'), (9,2,'2020-08-3'),
  (10,3,'2020-05-24'), (10,1,'2021-01-11');

-- INSERT 3million plus data into visits table
  INSERT INTO visits (animals_id, vets_id, date_of_visit) 
  SELECT * FROM (SELECT id FROM animals) animals_ids, 
  (SELECT id FROM vets) vets_ids, 
  generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- INSERT 2.5million data int owners table
  insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 
  'owner_' || generate_series(1,2500000) || '@mail.com';

  insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 
  'owner_' || generate_series(1,2500000) || '@mail.com';