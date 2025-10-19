USE nutrisante_db;

CREATE OR REPLACE VIEW vueProduit AS
SELECT 
    P.idProduit,
    P.nom AS nomProduit,
    P.description AS descriptionProduit,
    P.prixUnitaire,
    P.stock,
    C.idCategorie,
    C.nom AS nomCategorie,
    C.description AS descriptionCategorie,
    AVG(A.note) AS moyenneNote,
    (
        SELECT I2.url
        FROM ImageProduit I2
        WHERE I2.idProduit = P.idProduit
        ORDER BY I2.idImageProduit ASC
        LIMIT 1
    ) AS urlPrincipale,
    SUM(Cd.quantite) AS nbExemplairesCommandes
FROM 
    Produit P
    JOIN Categorie C ON C.idCategorie = P.idCategorie
    LEFT JOIN AvisProduit A ON A.idProduit = P.idProduit
    LEFT JOIN CommandeDetail Cd ON Cd.idProduit = P.idProduit
GROUP BY 
    P.idProduit, P.nom, P.description, P.prixUnitaire, P.stock,
    C.idCategorie, C.nom, C.description
ORDER BY 
    C.nom ASC,          -- catégorie croissante
    P.nom ASC,          -- nom du produit croissant
    P.prixUnitaire ASC, -- prix croissant
    P.stock DESC;       -- stock décroissant

    SELECT * FROM vueProduit;

USE nutrisante_db;


CREATE OR REPLACE VIEW vueAvisUtilisateur AS
SELECT U.idUtilisateur, P.nom AS nomProduit, CONCAT(U.prenom, U.nom) AS nomComplet
,P.description, C.nom AS nomCategorie, A.note, A.commentaire, A.dateAvis
FROM Utilisateur U RIGHT JOIN AvisProduit A 
ON U.idUtilisateur = A.idUtilisateur
LEFT JOIN Produit P
ON P.idProduit = A.idAvisProduit
LEFT JOIN Categorie C 
ON C.idCategorie = P.idCategorie
ORDER BY dateAvis DESC;

SELECT * FROM vueAvisUtilisateur;


USE nutrisante_db;

CREATE OR REPLACE VIEW vueProduitMouvement AS
SELECT P.idProduit, P.nom, C.nom AS nomCategorie,
CASE
    WHEN S.typeMouvement = 1 THEN 'Entree'
    ELSE 'Sortie'
END AS typeMouvement
, S.quantite, S.motif, S.dateMouvement
FROM  Produit P RIGHT JOIN StockMouvement S
ON P.idProduit = S.idProduit
LEFT JOIN Categorie C
ON C.idCategorie = P.idCategorie
ORDER BY nomCategorie, P.idProduit, dateMouvement;

SELECT * FROM vueProduitMouvement;

/* salut mon coeur*/
CREATE OR ALTER VIEW 
-- je t'aime