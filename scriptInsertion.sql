USE nutrisante_db;

-- =========================
-- 1️⃣ CATEGORIES
-- =========================
INSERT INTO Categorie (nom, description) VALUES
('Vitamines', 'Produits pour renforcer le système immunitaire.'),
('Minéraux', 'Suppléments riches en magnésium, zinc et calcium.'),
('Protéines', 'Produits pour la récupération et la croissance musculaire.'),
('Cosmétiques naturels', 'Soins naturels pour la peau et les cheveux.'),
('Huiles essentielles', 'Huiles naturelles pour la relaxation et le bien-être.'),
('Produits bio', 'Aliments et suppléments issus de l’agriculture biologique.');

-- =========================
-- 2️⃣ PRODUITS
-- =========================
INSERT INTO Produit (idCategorie, nom, description, prixUnitaire, stock) VALUES
(1, 'Vitamine C 1000mg', 'Renforce les défenses naturelles et réduit la fatigue.', 15.90, 120),
(1, 'Complexe B12', 'Favorise l’énergie et le métabolisme.', 19.50, 90),
(2, 'Magnésium Marin', 'Aide à réduire le stress et la fatigue musculaire.', 12.80, 150),
(3, 'Protéine Whey Vanille', 'Favorise la récupération musculaire après l’effort.', 39.90, 75),
(3, 'Protéine Végétale Chocolat', 'Alternative végétale riche en protéines.', 42.50, 60),
(4, 'Crème Hydratante Aloe Vera', 'Hydrate intensément la peau.', 18.75, 80),
(4, 'Huile de Ricin Pure', 'Stimule la pousse des cheveux et nourrit la peau.', 11.20, 100),
(5, 'Huile Essentielle de Lavande', 'Apaise le stress et améliore le sommeil.', 9.99, 200),
(5, 'Huile Essentielle de Menthe Poivrée', 'Effet rafraîchissant et tonifiant.', 10.50, 150),
(6, 'Spiruline Bio 500mg', 'Source naturelle de fer et d’antioxydants.', 16.40, 130);

-- =========================
-- 3️⃣ IMAGES PRODUITS
-- =========================
INSERT INTO ImageProduit (idProduit, url) VALUES
(1, 'images/vitaminec.jpg'),
(2, 'images/b12.jpg'),
(3, 'images/magnesium.jpg'),
(4, 'images/whey.jpg'),
(5, 'images/proteine_veg.jpg'),
(6, 'images/aloe.jpg'),
(7, 'images/ricin.jpg'),
(8, 'images/lavande.jpg'),
(9, 'images/menthe.jpg'),
(10, 'images/spiruline.jpg');

-- =========================
-- 4️⃣ ADRESSES
-- =========================
INSERT INTO Adresse (pays, ville, codePostal) VALUES
('Canada', 'Montréal', 'H3A1B9'),
('Canada', 'Québec', 'G1K7P4'),
('France', 'Paris', '75001');

-- =========================
-- 5️⃣ UTILISATEURS
-- =========================
INSERT INTO Utilisateur (idAdresse, nom, prenom, email, dateInscription, sel, motDePasseHache, isAdmin, telephone) VALUES
(1, 'Admin', 'NutriSanté', 'admin@nutrisante.com', NOW(), 'A', 'admin123', 1, 0000000000),
(2, 'Doe', 'John', 'john.doe@email.com', NOW(), 'B', 'user123', 0, 1234567890),
(3, 'Dupont', 'Marie', 'marie.dupont@email.com', NOW(), 'C', 'marie123', 0, 987654321);

-- =========================
-- 6️⃣ PANIERS
-- =========================
INSERT INTO Panier (idUtilisateur) VALUES (2), (3);

-- =========================
-- 7️⃣ DETAILS DU PANIER
-- =========================
INSERT INTO PanierDetail (idPanier, idProduit, quantite, prixUnitaire) VALUES
(1, 1, 2, 15.90),
(1, 4, 1, 39.90),
(2, 6, 2, 18.75);

-- =========================
-- 8️⃣ COMMANDES
-- =========================
INSERT INTO Commande (idUtilisateur, dateCommande) VALUES
(2, NOW()),
(3, NOW());

-- =========================
-- 9️⃣ DETAILS DES COMMANDES
-- =========================
INSERT INTO CommandeDetail (idCommande, idProduit, quantite) VALUES
(1, 1, 2),
(1, 4, 1),
(2, 6, 2);

-- =========================
-- 🔟 STOCK MOUVEMENTS
-- =========================
INSERT INTO StockMouvement (idProduit, typeMouvement, quantite, dateMouvement, motif) VALUES
(1, 1, 200, NOW(), 'Stock initial'),
(2, 1, 150, NOW(), 'Stock initial'),
(3, 1, 100, NOW(), 'Stock initial'),
(4, 1, 60, NOW(), 'Stock initial'),
(5, 1, 80, NOW(), 'Stock initial'),
(6, 1, 120, NOW(), 'Stock initial'),
(7, 1, 90, NOW(), 'Stock initial'),
(8, 1, 200, NOW(), 'Stock initial'),
(9, 1, 150, NOW(), 'Stock initial'),
(10, 1, 130, NOW(), 'Stock initial');

-- =========================
-- 1️⃣1️⃣ AVIS PRODUITS
-- =========================
INSERT INTO AvisProduit (idUtilisateur, idProduit, note, commentaire, dateAvis) VALUES
(2, 1, 5, 'Excellent produit, efficace dès la première semaine.', NOW()),
(3, 4, 4, 'Bonne texture, hydrate bien la peau.', NOW()),
(2, 8, 5, 'L’odeur de lavande est parfaite pour se détendre.', NOW());

-- =========================
-- 1️⃣2️⃣ CONNEXIONS
-- =========================
INSERT INTO Connexion (idUtilisateur, dateConnexion, reussie) VALUES
(1, NOW(), 1),
(2, NOW(), 1),
(3, NOW(), 0);

select * from Connexion;