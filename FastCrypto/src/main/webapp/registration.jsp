<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stilePagina.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Registration</title>
<link rel="icon" type="image/x-icon" href="img/bitcoin.ico">
</head>
<body>
<!-- REGISTRATION FORM -->
<div class="text-center" style="padding:50px 0">
	<div class="logo">register</div>
	<div class="login-form-1">
		<form id="register-form" class="text-left" action="<%=request.getContextPath()%>/registration" method="post">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="email" class="sr-only">Email</label>
						<input type="text" class="form-control" id="email" name="email" placeholder="email*" required>
					</div>
					<div class="form-group">
						<label for="nome" class="sr-only">Nome</label>
						<input type="text" class="form-control" id="nome" name="nome" placeholder="name*" required>
					</div>
					<div class="form-group">
						<label for="cognome" class="sr-only">Cognome</label>
						<input type="text" class="form-control" id="cognome" name="cognome" placeholder="surname*" required>
					</div>
					<div class="form-group">
						<label for="nazione" class="sr-only">Nazione</label>
						<input type="text" class="form-control" id="nazione" name="nazione" placeholder="nation*" required>
					</div>
					<div class="form-group">
						<label for="citta" class="sr-only">Città</label>
						<input type="text" class="form-control" id="citta" name="citta" placeholder="city">
					</div>
					<div class="form-group">
						<label for="indirizzo" class="sr-only">Indirizzo</label>
						<input type="text" class="form-control" id="indirizzo" name="indirizzo" placeholder="address">
					</div>
					<div class="form-group">
						<label for="dataNascita" class="sr-only">Data nascita</label>
						<input type="date" class="form-control" id="dataNascita" name="dataNascita" placeholder="date*" required>
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="password*" required>
					</div>
					
					<div class="form-group login-group-checkbox">
						<input type="radio" class="" name="sesso" id="male" placeholder="sesso" value="M">
						<label for="male">male</label>
						
						<input type="radio" class="" name="sesso" id="female" placeholder="sesso" value="F">
						<label for="female">female</label>
					</div>
					
					<div class="form-group login-group-checkbox">
						<input type="checkbox" class="sr-only" id="reg_agree" name="reg_agree">
						<label for="reg_agree">i agree with terms*</label>
					</div>
				</div>
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>already have an account? <a href="login.jsp">login here</a></p>
			</div>
		</form>
	</div>
</div>

</body>
</html>