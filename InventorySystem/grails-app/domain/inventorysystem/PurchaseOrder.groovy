package inventorysystem

class PurchaseOrder {
	
	String invoiceNumber
	Date orderDateTime
	float totalPrice = 0.0
	
	static hasMany = [items: Product]
	static belongsTo = [User]
	
    static constraints = {
		invoiceNumber	(nullable:false)
		orderDateTime	(nullable:false)
		totalPrice		(nullable:false)
    }
	
	String toString(){
		return "$invoiceNumber - $orderDateTime"
	}
}
