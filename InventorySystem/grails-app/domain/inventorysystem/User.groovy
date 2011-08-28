package inventorysystem

class User {

	String firstName
	String lastName
	
	static hasMany = [purchaseOrders: PurchaseOrder]
	static belongsTo = [company: Company]
	
    static constraints = {
		firstName (blank:false)
		lastName  (blank:false)
    }
	
	String toString(){
		return "$lastName, $firstName"
	}
}
