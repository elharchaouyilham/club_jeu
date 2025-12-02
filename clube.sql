CREATE DATABASE club; 
USE club;
CREATE TABLE member(
    id_member INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(50),
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
