<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TasarimDersi.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Register</title>
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
				<li><a href="../Editor/DefaultEditor.aspx">Editör Girişi</a></li>
				<li><a href="../Hakem/DefaultHakem.aspx">Hakem Girişi</a></li>
				<li><a href="../Yazar/Register.aspx">Yazar Kayıt Ol</a></li>
			</ul>
		</div>
	</nav>
	<center>
	<div style="padding: 20px; background-color:white; width:40%;">
		<form id="form1" runat="server">
			<div>
				<p>İsim</p>
				<asp:TextBox ID="KayitIsim" runat="server" />
				<p>Soyisim</p>
				<asp:TextBox ID="KayitSoyisim" runat="server" />
				<p>e-Mail</p>
				<asp:TextBox ID="KayitEmail" runat="server" />
				<p>Kullanıcı Adı</p>
				<asp:TextBox ID="KayitUsername" runat="server" />
				<p>Parola</p>
				<asp:TextBox ID="KayitPassword" runat="server" />
				<br />
				<br />
				<asp:Button ID="KayitSubmit" Text="Kayıt Yap" runat="server" OnClick="Submit" />

			</div>
		</form>
	</div>
		</center>
</body>
</html>
