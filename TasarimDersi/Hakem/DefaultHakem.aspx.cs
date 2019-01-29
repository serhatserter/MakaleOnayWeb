using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TasarimDersi
{
	public partial class DefaultHakem : System.Web.UI.Page
	{
		MySql.Data.MySqlClient.MySqlConnection conn;
		MySql.Data.MySqlClient.MySqlCommand cmd;
		MySql.Data.MySqlClient.MySqlDataReader reader;
		String queryStr;
		String name, isim, soyisim, email, kAdi;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Submit(object sender, EventArgs e)
		{
			String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
			conn = new MySql.Data.MySqlClient.MySqlConnection(connStr);

			conn.Open();

			queryStr = "SELECT * FROM tasarimdersi.hakemkullanici WHERE KullaniciAdi='" + GirisUsername.Text +"' AND Sifre='" + GirisPassword.Text +"'";
			cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
			reader = cmd.ExecuteReader();

			name = "";
			while (reader.HasRows && reader.Read())
			{
				name = reader.GetString(reader.GetOrdinal("ID"));
				kAdi = reader.GetString(reader.GetOrdinal("KullaniciAdi"));
				isim = reader.GetString(reader.GetOrdinal("Isim"));
				soyisim = reader.GetString(reader.GetOrdinal("Soyisim"));
				email = reader.GetString(reader.GetOrdinal("Email"));
			}

			if (reader.HasRows)
			{
				Session["IDSes"] = name;
				Session["kAdiSes"] = kAdi;
				Session["IsimSes"] = isim;
				Session["SoyisimSes"] = soyisim;
				Session["EmailSes"] = email;
				Response.BufferOutput = true;
				Response.Redirect("MainHakem.aspx", false);
			}
			else
			{
				uyari.InnerText = "Giriş Başarısız";
			}


			reader.Close();
			conn.Close();
		}
	}
}