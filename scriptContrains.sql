-- ===========================================
-- 🔗 CONTRAINTES DE CLÉS ÉTRANGÈRES NUTRISANTÉ
-- ===========================================

USE nutrisante_db;

-- =========================
-- TABLE : Produit
-- =========================
ALTER TABLE Produit
ADD CONSTRAINT fk_produit_categorie
FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- =========================
-- TABLE : ImageProduit
-- =========================
ALTER TABLE ImageProduit
ADD CONSTRAINT fk_image_produit
FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- =========================
-- TABLE : Utilisateur
-- =========================
ALTER TABLE Utilisateur
ADD CONSTRAINT fk_utilisateur_adresse
FOREIGN KEY (idAdresse) REFERENCES Adresse(idAdresse)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- =========================
-- TABLE : Connexion
-- =========================
ALTER TABLE Connexion
ADD CONSTRAINT fk_connexion_utilisateur
FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- =========================
-- TABLE : AvisProduit
-- =========================
ALTER TABLE AvisProduit
ADD CONSTRAINT fk_avis_utilisateur
FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE AvisProduit
ADD CONSTRAINT fk_avis_produit
FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- =========================
-- TABLE : Panier
-- =========================
ALTER TABLE Panier
ADD CONSTRAINT fk_panier_utilisateur
FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- =========================
-- TABLE : PanierDetail
-- =========================
ALTER TABLE PanierDetail
ADD CONSTRAINT fk_panierdetail_panier
FOREIGN KEY (idPanier) REFERENCES Panier(idPanier)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE PanierDetail
ADD CONSTRAINT fk_panierdetail_produit
FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- =========================
-- TABLE : Commande
-- =========================
ALTER TABLE Commande
ADD CONSTRAINT fk_commande_utilisateur
FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- =========================
-- TABLE : CommandeDetail
-- =========================
ALTER TABLE CommandeDetail
ADD CONSTRAINT fk_commandedetail_commande
FOREIGN KEY (idCommande) REFERENCES Commande(idCommande)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE CommandeDetail
ADD CONSTRAINT fk_commandedetail_produit
FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- =========================
-- TABLE : StockMouvement
-- =========================
ALTER TABLE StockMouvement
ADD CONSTRAINT fk_stockmouvement_produit
FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
ON DELETE CASCADE
ON UPDATE CASCADE;

