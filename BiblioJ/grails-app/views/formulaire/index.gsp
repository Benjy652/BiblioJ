<%@ page import="biblioj.Livre"%>
<!DOCTYPE html>
<html>
<head>
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<link rel="stylesheet" media="screen" type="text/css" title="Exemple" href="/BiblioJ/static/css/styles.css"/>
		<link rel="stylesheet" media="screen" type="text/css" title="Exemple" href="/BiblioJ/static/css/main.css"/>
	</head>
<body>
<div id="grailsLogo"><a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'biblioj.png')}" alt="Grails"/></a></div>
		
	<a href="#create-auteur" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/accueil')}"><g:message
						code="default.home.label" /></a></li>
		</ul>
	</div>
	<div id="query">
	<div id="formulaire-recherche">
		<h1>Recherchez vos livres</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<fieldset class="form">
				<g:form controller="formulaire" action="recherche" method="post">
					<div class="fieldcontain">
						<label for="queryTitre"> Titre :</label>
						<g:textField name="queryTitre" value="${params.queryTitre}"/>
					</div>
					<div class="fieldcontain">
						<label for="queryType"> Type :</label>
						<g:textField name="queryType" value="${params.queryType}"/>
					</div>
					<div class="fieldcontain">
						<label for="queryAuteur"> Auteur :</label>
						<g:textField name="queryAuteur" value="${params.queryAuteur}"/>
					</div>
					<g:submitButton class="formSubmit" name="submit" value="OK" />
				</g:form>
			</fieldset>
	</div>
	
	<div id="panier">
	<div id="panierContent">
	 <img src="${resource(dir: 'images', file: 'books.png')}" /><h1>Panier</h1>
	<g:each in="${livreInstanceList}" status="i" var="livreInstance">
	</g:each>
	
	
	<g:if test="${panier!=null}">
   
	<g:each var="i" in="${ (0..<panier.size()) }">
   <img src="${resource(dir: 'images', file: 'book.png')}" /> <p>${panier.get(i)}</p>
  </g:each>
</g:if>

	
	</div>
	</div>
	</div>
	<div id="listeRecherche">
	
	
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
					
						<g:sortableColumn property="Auteur" title="${message(code: 'livre.nombreExemplaire.label', default: 'Auteur')}" />
					
						<g:sortableColumn property="nombreExemplaireDisponibles" title="${message(code: 'livre.nombreExemplaireDisponibles.label', default: 'Nombre Exemplaire Disponibles')}" />
					<g:sortableColumn property="typeDocument" title="${message(code: 'livre.typeDocument.label', default: 'Type Document')}" />
					<g:sortableColumn property="reservez" title="${message(code: 'livre.reservez', default: 'Reservez')}"/>

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${livreInstanceList}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: livreInstance, field: "auteur.value")}</td>
					
						<td>${fieldValue(bean: livreInstance, field: "nombreExemplaireDisponibles")}</td>
						
					
						<td>${fieldValue(bean: livreInstance, field: "typeDocument")}</td>
						
						
						
						
						
						<g:if test="${panier!=null}">
						<g:if test="${panier.contains(fieldValue(bean: livreInstance, field: "titre"))}"><td><g:link class="formSubmit3" action="retirer" params="[auteur:"${fieldValue(bean: livreInstance, field: "titre")}"]" id="${i}">Retirer</g:link></td>
						</g:if>
						<g:else>
						<g:if test="${fieldValue(bean: livreInstance, field: "nombreExemplaireDisponibles") !='0'}"><td><g:link class="formSubmit2" action="reserver" params="[auteur:"${fieldValue(bean: livreInstance, field: "titre")}"]" id="${i}">Reserver</g:link></td>
						</g:if>
						
						</g:else>
						</g:if>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate max="5" total="${livreInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
