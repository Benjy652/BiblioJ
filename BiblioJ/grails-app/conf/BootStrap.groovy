import biblioj.Auteur
import biblioj.Livre
import biblioj.TypeDocument

class BootStrap {

    def init = { servletContext ->
		
		def typeNouveaute = new TypeDocument(intitule:"Nouveauté")
		typeNouveaute.save()
		def typeLivreAdo = new TypeDocument(intitule:"Livre ado")
		typeLivreAdo.save()
		def typeLivreAdulte = new TypeDocument(intitule:"Livre adulte")
		typeLivreAdulte.save()
		
		def auteurVigan = new Auteur(nom:"de Vigan",prenom:"Delphine")
		auteurVigan.save()
		def auteurCollins = new Auteur(nom:"Collins",prenom:"Suzanne")
		auteurCollins.save()
		def auteurStockett = new Auteur(nom:"Stockett",prenom:"Kathryn")
		auteurStockett.save()
		def auteurCarrere = new Auteur(nom:"Carrère",prenom:"Emmanuel")
		auteurCarrere.save()
		def auteurMurakami = new Auteur(nom:"Murakami",prenom:"Haruki")
		auteurMurakami.save()
		def auteurDelacourt = new Auteur(nom:"Delacourt",prenom:"Grégoire")
		auteurDelacourt.save()
		
		def livre1 = new Livre(titre:"Rien ne s'oppose à la nuit : roman",nombreExemplaire:3,nombreExemplaireDisponibles:3,typeDocument:typeNouveaute)
		livre1.addToAuteur(auteurVigan)
		livre1.save()
		def livre2 = new Livre(titre:"Hunger games [Texte imprimé]",nombreExemplaire:1,nombreExemplaireDisponibles:1,typeDocument:typeLivreAdo)
		livre2.addToAuteur(auteurCollins)
		livre2.save()
		def livre3 = new Livre(titre:"La couleur des sentiments",nombreExemplaire:3,nombreExemplaireDisponibles:3,typeDocument:typeNouveaute)
		livre3.addToAuteur(auteurStockett)		
		livre3.save()
		def livre4 = new Livre(titre:"L'embrasement",nombreExemplaire:2,nombreExemplaireDisponibles:2,typeDocument:typeLivreAdo)
		livre4.addToAuteur(auteurCollins)
		livre4.save()		
		def livre5 = new Livre(titre:"Limonov",nombreExemplaire:3,nombreExemplaireDisponibles:3,typeDocument:typeNouveaute)
		livre5.addToAuteur(auteurCarrere)
		livre5.save()		
		def livre6 = new Livre(titre:"1Q84. 1. Avril-juin",nombreExemplaire:1,nombreExemplaireDisponibles:1,typeDocument:typeNouveaute)
		livre6.addToAuteur(auteurMurakami)
		livre6.save()		
		def livre7 = new Livre(titre:"1Q84. 3. Octobre-décembre",nombreExemplaire:1,nombreExemplaireDisponibles:1,typeDocument:typeNouveaute)
		livre7.addToAuteur(auteurMurakami)
		livre7.save()		
		def livre8 = new Livre(titre:"La révolte",nombreExemplaire:3,nombreExemplaireDisponibles:3,typeDocument:typeLivreAdo)
		livre8.addToAuteur(auteurCollins)
		livre8.save()		
		def livre9 = new Livre(titre:"La liste de mes envies",nombreExemplaire:4,nombreExemplaireDisponibles:4,typeDocument:typeLivreAdulte)
		livre9.addToAuteur(auteurDelacourt)
		livre9.save()
		def livre10 = new Livre(titre:"1Q84. 2. Juillet-septembre",nombreExemplaire:1,nombreExemplaireDisponibles:1,typeDocument:typeNouveaute)
		livre10.addToAuteur(auteurMurakami)
		livre10.save()
    }
    def destroy = {
    }
}
