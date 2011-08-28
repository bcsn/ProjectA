package inventorysystem

class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

     def scaffold = true
}
