package biblioj

class FormulaireController {

	
	ArrayList panier = new ArrayList()

    def index(Integer max) {
		//params.list('panier').eachWithIndex() { obj, i -> println "plop ${i}: ${obj}" };
		//panier=params.list('panier')
		
		params.max = Math.min(max ?: 5, 100)
		//params.panier.eachWithIndex() { obj, i -> println "plop ${i}: ${obj}" };
			
		[livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count()/*, panier:panier*/]
		
	}
	
	def retirer(Integer max){
		params.max = Math.min(max ?: 5, 100)
		int index=0
		
		if(session["auteur"]) panier=session["auteur"]
		if(params.auteur){
			panier.eachWithIndex() { obj, i -> if(obj==params.auteur) index=i };
		panier.remove(index)
		session["auteur"] = panier
		}
		
		def livre = Livre.createCriteria().get {
			ilike('titre',"%${params.auteur}%")
			lock true
		}
		if(livre){
		livre.nombreExemplaireDisponibles+=1
		livre.save()
		}
		println"session"
		panier.eachWithIndex() { obj, i -> println " ${i}: ${obj}" };
		/*for(x in panier){
			println " ${x} ${panier.size()}"
		}*/
		//auteur.each() { println " ${it} ${auteur.size()}" };
		//redirect(action: "index", params: [panier: panier])
		
		render(view: "index", model: [livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count(), panier:panier,offset: params.offset, max: params.max])
	}
	
	
	def reserver(Integer max){
		params.max = Math.min(max ?: 5, 100)		
		
		if(session["auteur"]) panier=session["auteur"]
		if(params.auteur) panier.add(params.auteur)
		session["auteur"] = panier
		
		def livre = Livre.createCriteria().get {
			ilike('titre',"%${params.auteur}%")
			lock true
		}
		if(livre){
		livre.nombreExemplaireDisponibles-=1
		livre.save()
		}
		println"session"
		panier.eachWithIndex() { obj, i -> println " ${i}: ${obj}" };
		/*for(x in panier){
			println " ${x} ${panier.size()}"
		}*/
		//auteur.each() { println " ${it} ${auteur.size()}" };
		//redirect(action: "index", params: [panier: panier])
		
		render(view: "index", model: [livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count(), panier:panier])
	}
	
	def recherche() {
		if(session["auteur"]) panier=session["auteur"]
		
		if (params.queryTitre.empty && params.queryType.empty && params.queryAuteur.empty) {
			flash.message = "Veuillez remplir au moins un des champs."
			redirect(action: "reserver")
		}
	   else{
		   flash.message = null
		   def list = Livre.createCriteria().list {
			   and {
				   if (!params.queryTitre.isEmpty()) {
					   ilike("titre","%${params.queryTitre}%")
				   }
				   typeDocument {
					   if (!params.queryType.isEmpty()) {
						   ilike("intitule","%${params.queryType}%")
					   }
				   }
				   auteur {
					   if (!params.queryAuteur.isEmpty()) {
						   ilike("nom","%${params.queryAuteur}%")
					   }
				   }
			   }
		   }
		   //redirect(action: "list")
		   render(view: "index", model: [livreInstanceList: list, livreInstanceTotal: list.size(),panier:panier])
	   }
	   
	}
}
