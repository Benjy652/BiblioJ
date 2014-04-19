package biblioj

class FormulaireController {

    def index(Integer max) {
			params.max = Math.min(max ?: 10, 100)
			[livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count()]
		
	}
	
	def recherche() {
		
		if (params.queryTitre.empty && params.queryType.empty && params.queryAuteur.empty) {
			flash.message = "Veuillez remplir au moins un des champs."
			redirect(action: "index")
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
		   render(view: "index", model: [livreInstanceList: list, livreInstanceTotal: list.size()])
	   }
	   
	}
}
