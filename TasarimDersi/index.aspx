<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TasarimDersi.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Anasayfa</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background ='../books.jpg';" >

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

    <form id="form1" runat="server">
		<center>
			<div style="height:100px"></div>
			<h1 style="color:white; font-family:'Times New Roman'; font-weight:bolder;">HOŞ GELDİNİZ</h1>
			<div style="height:50px"></div>
			<div style="background-color:darkgray; width:25%; border-color:black;">
			<ul class="nav sidebar-nav navbar-inverse">
				<li><a style="color:cadetblue;" href="../Yazar/Default.aspx">Yazar Girişi</a></li>
				<li><a style="color:cadetblue;" href="../Editor/DefaultEditor.aspx">Editör Girişi</a></li>
				<li><a style="color:cadetblue;" href="../Hakem/DefaultHakem.aspx">Hakem Girişi</a></li>
				<li><a style="color:cadetblue;" href="../Yazar/Register.aspx">Yazar Kayıt Ol</a></li>
			</ul>
		</div>
		</center>
    </form>
</body>
</html>
