USE nutrisante_db;

/* salut mon coeur*/
CREATE OR REPLACE VIEW vueGlobal 
AS 
SELECT c.idCommande AS NumeroCommande,c.dateCommande,u.idUtilisateur,u.nom,p.idCategorie,ca.nom AS Categorie,cd.idProduit,
p.nom AS nomProduit,p.description AS infoProduit,cd.quantite,p.prixUnitaire,(p.prixUnitaire*cd.quantite) AS PrixTotal 
FROM Utilisateur u 
JOIN Commande c ON u.idUtilisateur = c.idUtilisateur
JOIN CommandeDetail cd ON c.idCommande = cd.idCommande
JOIN Produit p ON cd.idProduit = p.idProduit 
JOIN Categorie ca ON p.idCategorie = ca.idCategorie;


SELECT * from vueGlobal;

CREATE OR REPLACE VIEW vueDetailPanier 
AS 
SELECT u.idUtilisateur,u.nom,pa.idPanier,p.nom AS nomProduit,
p.description AS infoProduit,pd.quantite,pd.prixUnitaire,(p.prixUnitaire*pd.quantite) AS PrixTotal
FROM Utilisateur u 
JOIN Panier pa
ON pa.idUtilisateur = u.idUtilisateur 
JOIN PanierDetail pd 
ON pa.idPanier = pd.idPanier
JOIN Produit p
ON pd.idProduit = p.idProduit;

SELECT * from vueDetailPanier;
