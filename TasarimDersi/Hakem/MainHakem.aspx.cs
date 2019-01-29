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
	public partial class MainHakem: System.Web.UI.Page
	{
		String name;
		public string belge = "z";
		int index;
		MySql.Data.MySqlClient.MySqlConnection conn;
		MySql.Data.MySqlClient.MySqlCommand cmd;
		MySql.Data.MySqlClient.MySqlDataReader reader;
		String queryStr;
		string kID;
		protected void Page_Load(object sender, EventArgs e)
		{
			ince.Visible = false;
			kID = Session["IDSes"].ToString();
			Profil();
			Tablo();
		}

		protected void PDF(object sender, EventArgs e)
		{
			embed1.Visible = true;
			GridViewRow gridViewRow = (GridViewRow)(sender as Control).Parent.Parent;
			index = gridViewRow.RowIndex;
			embed1.Src = "../resimler/" + tablo.Rows[index].Cells[5].Text;
			//Response.Redirect(Request.RawUrl);

		}
		protected void Incele(object sender, EventArgs e)
		{
			embed1.Src = "";
			embed1.Visible = false;
			ince.Visible = true;
			GridViewRow gridViewRow = (GridViewRow)(sender as Control).Parent.Parent;
			index = gridViewRow.RowIndex;
			belge = tablo.Rows[index].Cells[5].Text;
			h.InnerText = belge;
		}

		protected void Onayla(object sender, EventArgs e)
		{
			belge = h.InnerText;

			String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

			using (conn = new MySql.Data.MySqlClient.MySqlConnection(connStr))
			{
				conn.Open();

				if (OnayRadio.SelectedValue == "Makaleyi Onayla") queryStr = "Update tasarimdersi.yazarmakale set onay = 'Hakem tarafından Onaylandı' WHERE makalepdf ='" + belge + "'";
				else if (OnayRadio.SelectedValue == "Makaleyi Reddet") queryStr = "Update tasarimdersi.yazarmakale set onay = 'Hakem tarafından ONAYLANMADI' WHERE makalepdf ='" + belge + "'";
				else if (OnayRadio.SelectedValue == "Makaleyi Onay Sürecinde Bırak") queryStr = "Update tasarimdersi.yazarmakale set onay = 'Hakem İncelemesinde' WHERE makalepdf ='" + belge + "'";
				else queryStr = "Update tasarimdersi.yazarmakale set onay = 'Editör İncelemesinde' WHERE makalepdf ='" + belge + "'";

				cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
				cmd.ExecuteReader();
				conn.Close();
				Response.Redirect(Request.RawUrl);
			}

		}

		void Profil()
		{
			pKadi.InnerText = Session["kAdiSes"].ToString();
			pIsim.InnerText = Session["IsimSes"].ToString();
			pSoyisim.InnerText = Session["SoyisimSes"].ToString();
			pMail.InnerText = Session["EmailSes"].ToString();
		}

		void Tablo()
		{

			String connStr = System.Configuration.ConfigurationManager.ConnectionStrings["WebConnString"].ToString();

			using (conn = new MySql.Data.MySqlClient.MySqlConnection(connStr))
			{
				if (Cache["tablo"] == null)
				{
					queryStr = "SELECT * FROM tasarimdersi.yazarmakale INNER JOIN tasarimdersi.yazarkullanici ON tasarimdersi.yazarmakale.ID=tasarimdersi.yazarkullanici.ID WHERE hakem="+ kID;


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