<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>COVID</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&family=Montserrat:wght@200&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="icon" href="images/logo.jpg">
  <script src=" https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/e77861a799.js" crossorigin="anonymous"></script>
</head>

<body class="head">
  <nav class="navbar navbar-expand-lg navbar-dark head">
    <a class="navbar-brand" href=""> <i class="fas fa-laptop-code"></i> COVID</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/projet/Acceuil"> Acceuil<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/projet/Statistiques">Statistiques</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/projet/MesuresGouv">Mesures Gouvernementales</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/projet/Vaccination">Vaccination</a>
        </li>
        <li class="nav-item active">
          ${connected}
        </li>
      </ul>
    </div>
  </nav>



  <div class="body text-white padding-bottom padding-top">

    <hr class="padding-bottom">
      <div class="MesuresGouv">
        <h2 class="center display-3 title">Vaccination</h2>
        <h3 class="center display-6 subtitle"> Découvrez les dates de vaccination disponibles.</h3>
      </div>
      <form class = "center" action = "Vaccination" method= "post">
      <table class="center padding-bottom margin-bottom ">
        <tr>
          <td><p class="text-left ">Date des annonces</p></td>
          <td><input  class = "center" id="datevaccins" type="date" name="datevaccins" required placeholder="JJ/MM/AAAA"></td>
        </tr>
        </table>
        <button class="btn btn-success margin-bottom" type="submit" name="submit" id="submit">Chercher</button>
      ${erreur}
      </form>
          ${ajoutvaccins}
      <hr class="padding-bottom">
  </div>
  <div class="body text-white padding-bottom padding-top">
    <table  class = "center" width = "100%">
      <tr>
         <th width="25%" > <font size="6"> ID </font></th>
         <th width="25%"> <font size="6"> Heure</font></th>
         <th width="25%"> <font size="6"> Centre</font></th>
         <th width="25%"> <font size="6"> Vaccin</font></th>
      </tr>
       <% String[] vaccins = (String[])request.getAttribute("vaccins"); %>
       <% String[] couleurs = (String[])request.getAttribute("couleursVacc"); %>
       <% if (vaccins != null) { %>
       <% for (int i=0; i<vaccins.length; i++) { %>
        <tr>
            <td> <font size="4"> <a class="nav-link center" href="ReserverVaccin?vaccin=<% out.println((vaccins[i].split(";"))[0]);%>"><font color=<%out.print(couleurs[i]);%> %><%out.println((vaccins[i].split(";"))[0]);%> </font></a></font></td>
            <td> <font size="4"> <%out.println((vaccins[i].split(";"))[1]);%></font></td>
            <td> <font size="4">  <%out.println((vaccins[i].split(";"))[2]);%></font></td>
            <td> <font size="4"> <%out.println((vaccins[i].split(";"))[3]);%></font></td> 
        </tr>
       <%}} %>
  </table>
  </div>

</html>