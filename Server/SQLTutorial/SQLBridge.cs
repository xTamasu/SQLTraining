using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace SQLTutorial
{
    public class SQLBridge
    {

        static string connectionString = "server=localhost;user=busunternehmen;pwd=jäckel;database=busunternehmen;port=3306;";
        static string[] forbiddenCommands = {"delete", "update", "insert"};

        public TableResult Query(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
            {
                throw new ArgumentException("Query was empty");
            }

            TableResult table = null;

            string lowerQuery = query.ToLower();
            foreach (var command in forbiddenCommands)
            {
                if (lowerQuery.Contains(command))
                {
                    throw new ArgumentException("DELETE UPDATE INSERT not allowed");
                }
            }

            MySqlConnection conn = new MySqlConnection(connectionString);
            try
            {
                conn.Open();

                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                table = new TableResult(rdr);
                
                rdr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return table;
        }
    }
}
