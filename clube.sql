CREATE DATABASE club; 
USE club;
CREATE TABLE member(
    id_member INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(50) ,    -- default 'mouna '  --  nulluble
    date_member DATE
); 
CREATE TABLE jeu(
    id_jeu INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(60),
    studio VARCHAR(34)
);
CREATE TABLE tournoi(
    id_tournoi INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(35),
    date_tournoi DATE,
    recompenses VARCHAR(45)
); 
CREATE TABLE emprunt(
    id_emprunt INT PRIMARY KEY AUTO_INCREMENT,
    date_debutemprunt DATE,
    date_finemprunt DATE,
    id_jeu INT,
    id_member INT,
    FOREIGN KEY(id_jeu) REFERENCES jeu(id_jeu),
    FOREIGN KEY(id_member) REFERENCES member(id_member)
); 
CREATE TABLE abonnement(
    id_abonnement INT PRIMARY KEY AUTO_INCREMENT,
    TYPE VARCHAR(50),
    date_debutabonnement DATE,
    date_finabonnement DATE,
    id_member INT,
    FOREIGN key (id_member) REFERENCES member(id_member)
);
CREATE TABLE resultat(
    id_resultat INT PRIMARY KEY AUTO_INCREMENT,
    score INT,
    id_member INT,
    id_tournoi INT,
    FOREIGN KEY(id_member) REFERENCES member(id_member),
    FOREIGN KEY(id_tournoi) REFERENCES tournoi(id_tournoi)
);


ALTER TABLE member
ADD email VARCHAR(55);
ALTER TABLE jeu
ADD genre VARCHAR(55);
INSERT INTO jeu (titre, studio, genre)
VALUES
('FIFA 23', 'EA Sports', 'Sport'),
('Minecraft', 'Mojang', 'Sandbox'),
('League of Legends', 'Riot Games', 'MOBA');
INSERT INTO member (pseudo, date_member, email)
VALUES
('said', '2024-01-15', 'said@gmail.com'),
('ilham', '2024-02-10', 'ilham@yahoo.com'),
('karim', '2024-03-05', 'karim@hotmail.com');
INSERT INTO emprunt (date_debutemprunt, date_finemprunt, id_jeu, id_member)
VALUES
('2024-01-20', '2024-01-25', 1, 1),
('2024-02-12', '2024-02-18', 2, 2),
('2024-03-08', '2024-03-15', 3, 3);
INSERT INTO tournoi (nom, date_tournoi, recompenses)
VALUES
('Tournoi Printemps', '2024-04-20', 'Médaille + 100€'),
('Championnat Été', '2024-07-10', 'Coupe + 200€'),
('ilham', '2024-09-05', 'T-shirt + Cadeaux');
INSERT INTO abonnement (TYPE, date_debutabonnement, date_finabonnement, id_member)
VALUES
('Mensuel', '2024-01-01', '2024-01-31', 1),
('Trimestriel', '2024-02-01', '2024-04-30', 2),
('Annuel', '2024-01-01', '2024-12-31', 3);
INSERT INTO resultat (score, id_member, id_tournoi)
VALUES
(85, 1, 1),
(92, 2, 2),
(75, 3, 3);
select pseudo ,date_member, email from member ;
select genre,studio,titre from jeu;
select * from tournoi where nom="ilham";
select * from  abonnement where id_abonnement =3;
select * from member where pseudo like 'i%';
select * from member where id_member=2 or pseudo like 's%';
select * from jeu WHERE titre = 'FIFA 23' and genre like 's%';
UPDATE member set pseudo = "mourad" WHERE pseudo = "said";
DELETE FROM member WHERE pseudo = "mourad";
UPDATE member set pseudo = "said" WHERE id_member = 1;
select * from jeu order by titre desc ;
select * from resultat order by score asc ;
select id_resultat from resultat order by score asc;




SELECT m.pseudo ,
j.titre  
FROM emprunt e
JOIN member m ON e.id_member = m.id_member
JOIN jeu j ON e.id_jeu = j.id_jeu
WHERE e.date_finemprunt is null;
