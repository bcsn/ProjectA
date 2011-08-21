package inventorysystem

class PurchaseOrder {

	String poDescription
	Date poDateTime
	
	static belongsTo = [Employee]
	static hasMany = [orderOwners:Employee]

    static constraints = {
		
		poDescription (nullable:false)
		poDateTime (nullable:false)
    }
}
