using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TasarimDersi
{
	public partial class MainYazar : System.Web.UI.Page
	{
		string isim,makalePath,makaleIsim;
		int index;
		
		MySql.Data.MySqlClient.MySqlConnection conn;
		MySql.Data.MySqlClient.MySqlCommand cmd;
		MySql.Data.MySqlClient.MySqlDataReader reader;
		String queryStr;

		protected void Page_Load(object sender, EventArgs e)
		{
			string kID = Session["IDSes"].ToString();
			Profil();
			Tablo(kID);
		}

		protected void Submit(object sender, EventArgs e)
		{
			string kID = Session["IDSes"].ToString();
			Ekle(kID);
			
		}

		protected void PDF(object sender, EventArgs e)
		{
			GridViewRow gridViewRow = (GridViewRow)(sender as Control).Parent.Parent;
			index = gridViewRow.RowIndex;
			embed1.Src = "../resimler/"+ tablo.Rows[index].Cells[3].Text;
			//Response.Redirect(Request.RawUrl);

		}


		void Ekle(string kID)
		{
			int makaleID = 1;

			String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
			conn = new MySql.Data.MySqlClient.MySqlConnection(connStr);
			conn.Open();

			queryStr = "SELECT * FROM tasarimdersi.yazarmakale WHERE ID= "+kID+ " AND MakaleID = (SELECT MAX(MakaleID) FROM tasarimdersi.yazarmakale WHERE ID= " + kID + ")";


			cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
			reader = cmd.ExecuteReader();

			while (reader.HasRows && reader.Read())
			{
				makaleID = reader.GetInt16(reader.GetOrdinal("MakaleID")) + 1;
			}

			conn.Close();


			if (FileUpload1.HasFile)
			{
				if (FileUpload1.PostedFile.ContentType == "application/pdf")
				{
					if (FileUpload1.PostedFile.ContentLength < 10240000)
					{
						isim = Session["IDSes"].ToString() + "-" + makaleID;
						makaleIsim = isim + ".pdf";
						makalePath = (Server.MapPath("//resimler//") + makaleIsim);
						FileUpload1.SaveAs(makalePath);
						
					}
					else lblMesaj.InnerText = "Dosya boyutu maximum 10MB olmalıdır.";
				}
				else lblMesaj.InnerText = "Sadece pdf uzantılı dosyalar yüklenebilir.";
			}
			else lblMesaj.InnerText = "Lütfen bir dosya seçiniz.";


			conn.Open();
			queryStr = "INSERT INTO tasarimdersi.yazarmakale (ID,MakaleID,alan,baslik,aciklama,makalepdf,onay)" +
						"Values('" + kID + "','" + makaleID + "','" + Alan.Text + "','" +
						Baslik.Text + "','" + Aciklama.Text + "','" + makaleIsim + "','" +"Editör İncelemesinde"+ "')";

			cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
			cmd.ExecuteReader();
			conn.Close();
			Response.Redirect(Request.RawUrl);
			
		}

		void Profil()
		{
			pKadi.InnerText = Session["kAdiSes"].ToString();
			pIsim.InnerText = Session["IsimSes"].ToString();
			pSoyisim.InnerText = Session["SoyisimSes"].ToString();
			pMail.InnerText = Session["EmailSes"].ToString();
		}



		void Tablo(string kID)
		{

			String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();
			
			using (conn = new MySql.Data.MySqlClient.MySqlConnection(connStr))
			{
				if (Cache["tablo"] == null)
				{
					queryStr = "SELECT * FROM tasarimdersi.yazarmakale WHERE ID= " + kID;


					cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);


					DataTable dataTable = new DataTable();
					MySqlDataAdapter da = new MySqlDataAdapter(cmd);

					da.Fill(dataTable);
					tablo.DataSource = dataTable;
					tablo.DataBind();

					

				}

			}

		}

	}
}