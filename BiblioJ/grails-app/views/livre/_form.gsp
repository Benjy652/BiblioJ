<%@ page import="biblioj.Livre" %>



<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'titre', 'error')} required">
	<label for="titre">
		<g:message code="livre.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="titre" cols="40" rows="5" maxlength="300" required="" value="${livreInstance?.titre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'nombreExemplaire', 'error')} required">
	<label for="nombreExemplaire">
		<g:message code="livre.nombreExemplaire.label" default="Nombre Exemplaire" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nombreExemplaire" type="number" min="1" value="${livreInstance.nombreExemplaire}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'nombreExemplaireDisponibles', 'error')} required">
	<label for="nombreExemplaireDisponibles">
		<g:message code="livre.nombreExemplaireDisponibles.label" default="Nombre Exemplaire Disponibles" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nombreExemplaireDisponibles" type="number" min="1" value="${livreInstance.nombreExemplaireDisponibles}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'typeDocument', 'error')} ">
	<label for="typeDocument">
		<g:message code="livre.typeDocument.label" default="Type Document" />
		
	</label>
	<g:select id="typeDocument" name="typeDocument.id" from="${biblioj.TypeDocument.list()}" optionKey="id" value="${livreInstance?.typeDocument?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'auteur', 'error')} ">
	<label for="auteur">
		<g:message code="livre.auteur.label" default="Auteur" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'reservation', 'error')} ">
	<label for="reservation">
		<g:message code="livre.reservation.label" default="Reservation" />
		
	</label>
	<g:select name="reservation" from="${biblioj.Reservation.list()}" multiple="multiple" optionKey="id" size="5" value="${livreInstance?.reservation*.id}" class="many-to-many"/>
</div>

