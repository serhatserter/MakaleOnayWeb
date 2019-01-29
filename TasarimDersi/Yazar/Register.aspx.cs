using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace TasarimDersi
{
	public partial class Register : System.Web.UI.Page
	{
		MySql.Data.MySqlClient.MySqlConnection conn;
		MySql.Data.MySqlClient.MySqlCommand cmd;
		MySql.Data.MySqlClient.MySqlDataReader reader;
		String queryStr;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Submit(object sender, EventArgs e)
		{
			registerUser();
		}

		private void registerUser()
		{
			int ID = 1000;
			String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
			conn = new MySql.Data.MySqlClient.MySqlConnection(connStr);
			conn.Open();

			queryStr = "SELECT * FROM tasarimdersi.yazarkullanici WHERE ID = (SELECT MAX(ID) FROM tasarimdersi.yazarkullanici)";
			

			cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
			reader = cmd.ExecuteReader();

			while (reader.HasRows && reader.Read())
			{
				ID = reader.GetInt16(reader.GetOrdinal("ID")) + 1;
			}

			conn.Close();

			conn.Open();
			queryStr = "INSERT INTO tasarimdersi.yazarkullanici (ID,KullaniciAdi,Sifre,Isim,Soyisim,Email)" +
						"Values('"+ID + "','" + KayitUsername.Text +"','" + KayitPassword.Text + "','" + 
						KayitIsim.Text + "','" + KayitSoyisim.Text + "','" + KayitEmail.Text + "')";

			cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
			cmd.ExecuteReader();
			conn.Close();

			Response.Redirect("Default.aspx", false);
		}
		
	}
}