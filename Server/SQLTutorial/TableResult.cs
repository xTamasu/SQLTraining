using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace SQLTutorial
{
    public class TableResult
    {

        public readonly string Query;
        private readonly MySqlDataReader DataReader;
        public List<Column> Columns = new List<Column>();
        public List<Row> Rows = new List<Row>();

        private uint lastRowId = 0;
        private uint lastColumnId = 0;

        public TableResult(MySqlDataReader mySqlDataReader)
        {
            this.DataReader = mySqlDataReader;
            this.Query = "";
            BuildRows();
            BuildColumns();
            BuildTable();
        }

        public TableResult(string query, MySqlDataReader mySqlDataReader)
        {
            this.DataReader = mySqlDataReader;
            this.Query = query;
            BuildRows();
            BuildColumns();
            BuildTable();
        }

        public IEnumerable<string> GetAllRowValues()
        {
            List<string> stringList = new List<string>();
            this.Rows.ForEach(x => x.Values.ForEach(y => stringList.Add(y)));
            return stringList;
        }

        private void BuildRows()
        {
            if (DataReader.HasRows)
            {
                while (DataReader.Read())
                {
                    Row row = new Row(lastRowId++);
                    for (int i = 0; i < DataReader.FieldCount; i++)
                    {
                        var cell = DataReader[i].ToString();
                        row.Values.Add(cell);
                    }
                    Rows.Add(row);
                }
            }
        }

        private void BuildColumns()
        {
            for (int i = 0; i < DataReader.FieldCount; i++)
            {
                Column column = new Column(lastColumnId, DataReader.GetName(i));
                Columns.Add(column);
            }
        }

        private void BuildTable()
        {
            for (int i = 0; i < Columns.Count; i++)
            {
                for (int j = 0; j < Rows.Count; j++)
                {
                    Columns[i].Values.Add(Rows[j].Values[i]);
                }
            }
        }

    }

    public class Column
    {
        public Column(uint id, string name)
        {
            ID = id;
            Name = name;
        }
        public uint ID { get; set; }
        public string Name { get; set; }
        public List<string> Values { get; set; } = new List<string>();
    }

    public class Row
    {
        public Row(uint id)
        {
            ID = id;
        }
        public uint ID { get; set; }
        public List<string> Values { get; set; } = new List<string>();
    }
}
