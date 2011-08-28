package inventorysystem

class CompanyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def scaffold = true
}
