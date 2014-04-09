package biblioj

class Reservation {
	
	long code
	Date dateReservation
	static belongsTo = Livre
	static hasMany = [livre:Livre]

    static constraints = {
		code blank:false, maxSize:1000
		dateReservation blank:false
    }
}
