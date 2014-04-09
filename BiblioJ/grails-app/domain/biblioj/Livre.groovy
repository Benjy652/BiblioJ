package biblioj

class Livre {
	String titre
	int nombreExemplaire
	int nombreExemplaireDisponibles
	TypeDocument typeDocument
	static belongsTo = Auteur
	static hasMany = [auteur:Auteur,reservation:Reservation]

	
    static constraints = {
		titre blank:false, maxSize:300
		nombreExemplaire maxSize:300
		nombreExemplaireDisponibles maxSize:300
		typeDocument nullable:true
    }
}
