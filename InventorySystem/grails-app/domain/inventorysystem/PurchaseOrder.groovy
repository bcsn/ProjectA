package inventorysystem

class PurchaseOrder {
	
	String invoiceNumber
	Date orderDateTime
	float totalPrice = 0.0
	User purchaseOrderOwner
	
	static hasMany = [items: Product]
	
    static constraints = {
		invoiceNumber	(nullable:false)
		orderDateTime	(nullable:false)
		totalPrice		(nullable:false)
    }
	
	String toString(){
		return "$invoiceNumber - $orderDateTime"
	}
}
