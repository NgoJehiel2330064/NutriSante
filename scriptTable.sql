-- ================================
-- 🧱 STRUCTURE DE BASE NUTRISANTÉ
-- (Sans contraintes étrangères)
-- ================================

DROP DATABASE IF EXISTS nutrisante_db;
CREATE DATABASE nutrisante_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE nutrisante_db;

-- =====================================
-- TABLE : Categorie
-- =====================================
CREATE TABLE Categorie (
    idCategorie INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);

-- =====================================
-- TABLE : Produit
-- =====================================
CREATE TABLE Produit (
    idProduit INT AUTO_INCREMENT PRIMARY KEY,
    idCategorie INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    prixUnitaire DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- =====================================
-- TABLE : ImageProduit
-- =====================================
CREATE TABLE ImageProduit (
    idImageProduit INT AUTO_INCREMENT PRIMARY KEY,
    idProduit INT NOT NULL,
    url VARCHAR(255) NOT NULL
);

-- =====================================
-- TABLE : Adresse
-- =====================================
CREATE TABLE Adresse (
    idAdresse INT AUTO_INCREMENT PRIMARY KEY,
    pays VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    codePostal VARCHAR(20) NULL
);

-- =====================================
-- TABLE : Utilisateur
-- =====================================
CREATE TABLE Utilisateur (
    idUtilisateur INT AUTO_INCREMENT PRIMARY KEY,
    idAdresse INT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    dateInscription DATE NOT NULL,
    sel CHAR(36) NOT NULL,
    motDePasseHache VARBINARY(64) NOT NULL,
    isAdmin BIT NOT NULL DEFAULT 0,
    telephone INT NULL
);

-- =====================================
-- TABLE : Connexion
-- =====================================
CREATE TABLE Connexion (
    idConnexion INT AUTO_INCREMENT PRIMARY KEY,
    idUtilisateur INT NOT NULL,
    dateConnexion DATETIME NOT NULL,
    reussie BIT NOT NULL
);

-- =====================================
-- TABLE : AvisProduit
-- =====================================
CREATE TABLE AvisProduit (
    idAvisProduit INT AUTO_INCREMENT PRIMARY KEY,
    idUtilisateur INT NOT NULL,
    idProduit INT NOT NULL,
    note INT NOT NULL,
    commentaire TEXT NULL,
    dateAvis DATE NOT NULL
);

-- =====================================
-- TABLE : Panier
-- =====================================
CREATE TABLE Panier (
    idPanier INT AUTO_INCREMENT PRIMARY KEY,
    idUtilisateur INT NOT NULL
);

-- =====================================
-- TABLE : PanierDetail
-- =====================================
CREATE TABLE PanierDetail (
    idPanier INT NOT NULL,
    idProduit INT NOT NULL,
    quantite INT NOT NULL,
    prixUnitaire DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idPanier, idProduit)
);

-- =====================================
-- TABLE : Commande
-- =====================================
CREATE TABLE Commande (
    idCommande INT AUTO_INCREMENT PRIMARY KEY,
    idUtilisateur INT NOT NULL,
    dateCommande DATE NOT NULL
);

-- =====================================
-- TABLE : CommandeDetail
-- =====================================
CREATE TABLE CommandeDetail (
    idCommande INT NOT NULL,
    idProduit INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (idCommande, idProduit)
);

-- =====================================
-- TABLE : StockMouvement
-- =====================================
CREATE TABLE StockMouvement (
    idStockMouvement INT AUTO_INCREMENT PRIMARY KEY,
    idProduit INT NOT NULL,
    typeMouvement BIT NOT NULL,
    quantite INT NOT NULL,
    dateMouvement DATE NOT NULL,
    motif VARCHAR(255) NOT NULL
);

