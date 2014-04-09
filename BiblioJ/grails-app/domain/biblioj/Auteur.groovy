package biblioj

class Auteur {
	
	String nom
	String prenom
	static hasMany = [livre:Livre]

    static constraints = {
		nom blank:false
		prenom blank:false
    }
}
