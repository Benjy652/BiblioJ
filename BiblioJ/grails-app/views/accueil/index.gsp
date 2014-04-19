<!DOCTYPE html>
<html>
	<head>
		
		<title>Welcome to Grails</title>
		<link rel="stylesheet" media="screen" type="text/css" title="Exemple" href="/BiblioJ/static/css/styles.css"/>
		<link rel="stylesheet" media="screen" type="text/css" title="Exemple" href="/BiblioJ/static/css/main.css"/>
	</head>
	<body>
	<div id="grailsLogo"><a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'biblioj.png')}" alt="Grails"/></a></div>
		
		<div id="page-body" role="main">
			<h1>Bienvenue sur BiblioJ !</h1>
			<p>Ici vous pouvez parcourir notre bibliothèque et réserver nimporte quels livres disponible!</p>
	<div id="formulaireSelect">
			<a class="home" href="${createLink(uri: '/formulaire')}">Rechercher des livres</a>
		</div>
		</div>
		
		<div class="footer" role="contentinfo"></div>
	</body>
</html>
