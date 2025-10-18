using MySql.Data.MySqlClient;
using System.Collections.Generic;

namespace NutriSante.Data
{
    public class DatabaseService
    {
        private readonly string connectionString = "server=localhost;database=nutrisante_db;uid=root;pwd=;";

        public List<string> GetProduits()
        {
            var produits = new List<string>();
            using (var connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT nom FROM Produit";
                using (var command = new MySqlCommand(query, connection))
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                        produits.Add(reader.GetString("nom"));
                }

                return produits;

            }
        }
    }
}

