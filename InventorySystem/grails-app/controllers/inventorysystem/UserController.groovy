package inventorysystem

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

     def scaffold = true
}
