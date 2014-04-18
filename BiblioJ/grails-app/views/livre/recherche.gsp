<%@ page import="biblioj.Livre"%>
<!DOCTYPE html>
<html>
<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.recherche.label" args="[entityName]" /></title>
	</head>
<body>
	<a href="#create-auteur" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="formulaire-recherche">
		<h1>Formulaire de recherche</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<fieldset class="form">
				<g:form action="recherche" method="post">
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
					<g:submitButton name="submit" value="OK" />
				</g:form>
			</fieldset>
	</div>
</body>
</html>
