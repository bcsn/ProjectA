package inventorysystem

class Employee {

	String firstName
	String lastName
	String password
	String confirmpassword

	static hasMany = [orders:PurchaseOrder]

	static transients = ['confirmpassword']

	static constraints = {

		password (nullable:false,
				validator: {
					password, obj ->
					def password2 = obj.properties['confirmpassword']
					if (password2 == null) {
						return true
					}
					if (password2!=password) {
						return ['invalid.matchingPasswords']
					}
				}
				)


		confirmpassword (nullable:false)
	}

	String toString() {

		return "$lastName,$firstName"

	}
}
