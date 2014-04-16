package biblioj

class Auteur {
	
	String nom
	String prenom
	static hasMany = [livre:Livre]
	
	String toString(){
		nom + " " + prenom
		
	}

    static constraints = {
		nom blank:false
		prenom blank:false
    }
}
