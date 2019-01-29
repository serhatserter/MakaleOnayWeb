<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultEditor.aspx.cs" Inherits="TasarimDersi.DefaultEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Home</title>
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
		</div>
	</nav>
		<center>
	<div style="padding: 20px; background-color:white; width:40%;">
		<form id="form1" runat="server">
			<div>
				<h1>Editör Girişi</h1><br />
				<h1 id="uyari" runat="server"></h1>

				<p>Kullanıcı Adı</p>
				<asp:TextBox ID="GirisUsername" runat="server" />
				<br />
				<br /><p>Parola</p>
				<asp:TextBox TextMode="Password" ID="GirisPassword" runat="server" />
				<br />
				<br />
				<asp:Button ID="GirisSubmit" Text="Giriş Yap" runat="server" OnClick="Submit" />
				<br />
				<br /><br />
			</div>
		</form>
	</div>
			</center>
</body>
</html>
