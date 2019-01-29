<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainHakem.aspx.cs" Inherits="TasarimDersi.MainHakem" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Hakem Anasayfa</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background ='../books.jpg';">
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">HakemBul.com</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="../index.aspx">Anasayfa</a></li>
				<li><a href="../Yazar/Default.aspx">Yazar Girişi</a></li>
				<li><a href="../Hakem/DefaultHakem.aspx">Hakem Girişi</a></li>
				<li><a href="../Yazar/Register.aspx">Yazar Kayıt Ol</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<button class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span>Profil</button></li>
				<li><a href="../Yazar/Default.aspx"><span class="glyphicon glyphicon-log-out"></span>Çıkış</a></li>
			</ul>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">Profil Bilgileri</h2>
				</div>
				<div class="modal-body">
					<center>
					<h4>İsim: </h4>
					<p id="pIsim" runat="server">Some text in the modal.</p>
					<h4>Soyisim: </h4>
					<p id="pSoyisim" runat="server">Some text in the modal.</p>
					<h4>e-Mail: </h4>
					<p id="pMail" runat="server">Some text in the modal.</p>
					<h4>Kullanıcı Adı: </h4>
					<p id="pKadi" runat="server">Some text in the modal.</p>
					</center>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
				</div>
			</div>

		</div>
	</div>



	<div style="padding: 20px; background-color:white;">
		<form id="makale" class="form-inline" runat="server" enctype="multipart/form-data">

			<h3 id="h" runat="server">Eklenen Makaleler</h3>
			<div style=" background-color:white;">



				<asp:GridView ID="tablo" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" Style="float: left; width: 50%; background-color:white;">
					<Columns>
						<asp:BoundField DataField="Isim" HeaderText="İsim" />
						<asp:BoundField DataField="Soyisim" HeaderText="Soyisim" />
						<asp:BoundField DataField="alan" HeaderText="Alan" />
						<asp:BoundField DataField="baslik" HeaderText="Başlık" />
						<asp:BoundField DataField="aciklama" HeaderText="Açıklama" />
						<asp:BoundField DataField="makalepdf" HeaderText="Makale Dosya İsmi" />
						<asp:BoundField DataField="onay" HeaderText="Onay Durumu" />

						<asp:TemplateField ShowHeader="False">
							<ItemTemplate>
								<asp:Button ID="Button1" Text="PDF Göster" runat="server" OnClick="PDF" />
								<!--<button type="button"  class="btn btn-default" data-toggle="modal" data-target="#tabloGoster">Makaleyi Aç</button>-->
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField ShowHeader="False">
							<ItemTemplate>
								<asp:Button ID="Button2" Text="İncele" runat="server" OnClick="Incele" />
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>

				</asp:GridView>

				<div style = "height:700px;  background-color:white">
					<embed runat="server" src="" id="embed1" type="application/pdf" width="43%" height="400px" />
					<div id="ince" runat="server" width="43%" height="400px">
						<center>
				   <asp:RadioButtonList ID="OnayRadio" runat="server">
						<asp:ListItem>Makaleyi Onayla</asp:ListItem>
						<asp:ListItem>Makaleyi Reddet</asp:ListItem>
					   <asp:ListItem>Makaleyi Onay Sürecinde Bırak</asp:ListItem>

					</asp:RadioButtonList>
					<asp:Button ID="Button3" Text="Onayla" runat="server" OnClick="Onayla" />
					</center>
					</div>
				</div>


			</div>
		</form>
	</div>
</body>
</html>
