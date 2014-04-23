package biblioj

class Livre {
	String titre
	int nombreExemplaire
	int nombreExemplaireDisponibles
	TypeDocument typeDocument
	static belongsTo = Auteur
	static hasMany = [auteur:Auteur,reservation:Reservation]

	String toString(){
		titre
		
	}
	
    static constraints = {
		titre blank:false, maxSize:300
		nombreExemplaire maxSize:300, min:1
		nombreExemplaireDisponibles maxSize:300, min:0
		typeDocument nullable:true
    }
}
