package inventorysystem

class Product {

	String productCode
	String productName
	String productDescription
	float  productPrice = 0.0
	
	static belongsTo = [company: Company]
	
    static constraints = {
		productCode	(nullable:false, blank:false)
		productName (nullable:false, blank:false)
		productDescription (maxSize: 50, nullable:true)
		productPrice (nullable:false)
    }
	
	String toString(){
		return "$productCode - $productName"
	}
}
