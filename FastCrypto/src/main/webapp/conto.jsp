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
<title>Conto Crypto</title>
<link rel="icon" type="image/x-icon" href="img/bitcoin.ico">

</head>
<body>
	<%@page import="it.betacom.dao.*, it.betacom.bean.*, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<% 
	String mail=(String)session.getAttribute("username");
	Conto c=ContoDAO.getRecordByUsername(mail);
	request.setAttribute("c",c);
	%>
	
	<div data-role="header" class="text-right">
		<form id="euroForm" action="logout.jsp" method="post">
		<h4><% out.print(" Ciao, " +mail+" "); %></h4>
		<button type="submit">Logout</button>
		</form>
	</div>
	<c:set  var="conto" scope="session" value="${c}"/>
	<div class="text-center" style="padding:40px 0">
		<div class="logo">Your wallet:</div>
			<div class="login-form-1">
			<table>
				<tr>
					<th style="padding:0 15px">Euro</th>
					<th style="padding:0 15px">Bitcoin</th>
					<th style="padding:0 15px">Ethereum</th>
					<th style="padding:0 15px">Ripple</th>
				</tr>
				<tr>
					<td style="padding:0 15px">${String.format("%.3f", conto.getEuro())}</td>
					<td style="padding:0 15px">${String.format("%.3f",conto.getBitcoin())}</td>
					<td style="padding:0 15px">${String.format("%.3f",conto.getEthereum())}</td>
					<td style="padding:0 15px">${String.format("%.3f",conto.getRipple())}</td>
				</tr>
			</table>
			</div>
	</div>
	<div class="text-center" style="padding:40px 0">
			<div class="login-form-1">
			<h4>Euro to change:</h4>
			<form id="euroForm" class="text-left" action="bitcoinchange.jsp" method="post">
			<input type="hidden" id="bitVal" name="bitVal" value=""/>
			<input type="hidden" id="ethVal" name="ethVal" value=""/>
			<input type="hidden" id="ripVal" name="ripVal" value=""/>
				<div class="form-group">
					<label for="euro" class="sr-only">Euro</label>
					<input type="number" class="form-control" id="euroIns" name="euro" placeholder="0" min="1" max="${conto.getEuro()}">
				</div>
				<br/>
				<table>
				<tr>
					<th style="padding:0 15px">Bitcoin</th>
					<th style="padding:0 15px">Ethereum</th>
					<th style="padding:0 15px">Ripple</th>
				</tr>
				<tr>
					<th id="riga1" style="padding:0 15px"></th>
					<th id="riga2" style="padding:0 15px"></th>
					<th id="riga3" style="padding:0 15px"></th>
				</tr>
				<tr>
					<th style="padding:0 15px"><button type="submit">Change</button></th>
					<th style="padding:0 15px"><button type="submit" formaction="ethereumchange.jsp">Change</button></th>
					<th style="padding:0 15px"><button type="submit" formaction="ripplechange.jsp">Change</button></th>
				</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="text-center" style="padding:40px 0">
			<div class="login-form-1">
			<h4>Crypto to change:</h4>
			<form id="euroForm" class="text-left" action="eurobitcoin.jsp" method="post">
			<input type="hidden" id="eurVal1" name="eurVal1" value=""/>
			<input type="hidden" id="eurVal2" name="eurVal2" value=""/>
			<input type="hidden" id="eurVal3" name="eurVal3" value=""/>
				<table>
				<tr>
					<th style="padding:0 15px">Bitcoin</th>
					<th style="padding:0 15px">Ethereum</th>
					<th style="padding:0 15px">Ripple</th>
				</tr>
				<tr>
					<th style="padding:0 15px"><input type="number" class="form-control" id="bitIns" name="bitIns" placeholder="0" min="0.001" step="0.001" max="${conto.getBitcoin()}"></th>
					<th style="padding:0 15px"><input type="number" class="form-control" id="ethIns" name="ethIns" placeholder="0" min="0.001" step="0.001" max="${conto.getEthereum()}"></th>
					<th style="padding:0 15px"><input type="number" class="form-control" id="ripIns" name="ripIns" placeholder="0" min="0.001" step="0.001" max="${conto.getRipple()}"></th>
				</tr>
				<tr>
					<th id="riga4" style="padding:0 15px"></th>
					<th id="riga5" style="padding:0 15px"></th>
					<th id="riga6" style="padding:0 15px"></th>
				</tr>
				<tr>
					<th style="padding:0 15px"><button type="submit">Change</button></th>
					<th style="padding:0 15px"><button type="submit" formaction="euroethereum.jsp">Change</button></th>
					<th style="padding:0 15px"><button type="submit" formaction="euroripple.jsp">Change</button></th>
				</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>

document.getElementById('euroIns').addEventListener('input', update);
var riga = document.getElementById('riga1');
var riga2 = document.getElementById('riga2');
var riga3 = document.getElementById('riga3');
var hid1 = document.getElementById('bitVal');
var hid2 = document.getElementById('ethVal');
var hid3 = document.getElementById('ripVal');


function update(e) {
	var bitcoin;
	var ethereum;
	var ripple;
	fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Cripple&vs_currencies=eur&precision=2')
    .then(response => response.json())
    .then(risp => {
	  bitcoin=risp.bitcoin.eur;
  	  riga.innerHTML = (parseFloat(e.target.value)/bitcoin).toFixed(2);
  	  hid1.value=(parseFloat(e.target.value)/bitcoin).toFixed(2);
      ethereum=risp.ethereum.eur;
      riga2.innerHTML = (parseFloat(e.target.value)/ethereum).toFixed(2);
      hid2.value=(parseFloat(e.target.value)/ethereum).toFixed(2);
      ripple=risp.ripple.eur;
      riga3.innerHTML = (parseFloat(e.target.value)/ripple).toFixed(2);
      hid3.value=(parseFloat(e.target.value)/ripple).toFixed(2);
   });
};

document.getElementById('bitIns').addEventListener('input', update1);
document.getElementById('ethIns').addEventListener('input', update2);
document.getElementById('ripIns').addEventListener('input', update3);
var riga4 = document.getElementById('riga4');
var riga5 = document.getElementById('riga5');
var riga6 = document.getElementById('riga6');
var hidEur1 = document.getElementById('eurVal1');
var hidEur2 = document.getElementById('eurVal2');
var hidEur3 = document.getElementById('eurVal3');

  	function update1(e) {
  		var bitcoin;
 		fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Cripple&vs_currencies=eur&precision=2')
 	    .then(response => response.json())
 	    .then(risp => {
 		  bitcoin=risp.bitcoin.eur;
 	  	  riga4.innerHTML = (parseFloat(e.target.value)*bitcoin).toFixed(2);
 	  	  hidEur1.value=(parseFloat(e.target.value)*bitcoin).toFixed(2);
 	   });
  	};
  	
	function update2(e) {
		var ethereum;
		fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Cripple&vs_currencies=eur&precision=2')
		.then(response => response.json())
		.then(risp => {
		ethereum=risp.ethereum.eur;
		riga5.innerHTML = (parseFloat(e.target.value)*ethereum).toFixed(2);
		hidEur2.value=(parseFloat(e.target.value)*ethereum).toFixed(2);
		});
	};
		
	function update3(e) {
		var ripple;
		fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Cripple&vs_currencies=eur&precision=2')
		.then(response => response.json())
		.then(risp => {
		ripple=risp.ripple.eur;
		riga6.innerHTML = (parseFloat(e.target.value)*ripple).toFixed(2);
		hidEur3.value=(parseFloat(e.target.value)*ripple).toFixed(2);
		});
	};
		
 
</script>
</html>