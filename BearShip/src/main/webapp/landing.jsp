<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>BearShip</title>
<style>


*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body {
	background: #445;
	color: #FFF;
}

#main {
	background: linear-gradient(to bottom, rgba(0,0,0,0.66) 100%, transparent), url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/336999/shinokubo_test.jpg);
	background-size: cover, cover;
	background-position: center, center;
	height: 100vh;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

h1 {
	font-family:"ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", Osaka, "メイリオ", Meiryo, "ＭＳ Ｐゴシック", "MS PGothic", sans-serif;
	font-size: 2rem;
	display: inline-block;
	padding: 1rem;
	font-weight: 400;
	position: relative;
	opacity: 1;
	transform: scale(1);
	transition: transform 0.5s ease, opacity 1s ease;
	color: white;
}

.is-loading h1 {
	transform: scale(0.9);
	opacity: 0;
}

h1:before,
h1:after {
	height: 2px;
	width: 100%;
	content: "";
	background: white;
	display: block;
	position: absolute;
	transition: width 0.4s ease;
	transition-delay: 0.8s;
}

h1:before {
	top: 0;
	left: 0;
}

h1:after {
	bottom: 0;
	right: 0;
}

.is-loading h1:before,
.is-loading h1:after {
	width: 0;
}
</style>

</head>
<body>
<%@ include file="bootstrap.jsp" %>
<%@ include file="navbar.jsp" %>
<div id="main" class="is-loading">
	<h1>
		BearShip
	</h1>
</div>
<%@ include file="footer.jsp" %>
<script>
$(document).ready(function() {
	setTimeout(function() {
		$("#main").removeClass("is-loading");
	}, 50)
});
</script>
</body>
</html>