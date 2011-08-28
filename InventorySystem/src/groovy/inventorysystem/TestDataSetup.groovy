package inventorysystem

class TestDataSetup {

    void setupTestData() {
        setupCompany()
        setupProducts()
        setupUsers()
    }

    private setupCompany() {
        new Company(
                companyName: CommonConstants.TEST_COMPANY_NAME
                ).save(failOnError: true)
    }

    private setupProducts() {
        new Product (
                productCode:        CommonConstants.TEST_PRODUCT_CODE_1,
                productName:        CommonConstants.TEST_PRODUCT_NAME_1,
                productDescription: CommonConstants.TEST_PRODUCT_DESC_1,
                productPrice:       CommonConstants.TEST_PRODUCT_PRICE_1,
                company:            Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)

        new Product (
                productCode:        CommonConstants.TEST_PRODUCT_CODE_2,
                productName:        CommonConstants.TEST_PRODUCT_NAME_2,
                productDescription: CommonConstants.TEST_PRODUCT_DESC_2,
                productPrice:       CommonConstants.TEST_PRODUCT_PRICE_2,
                company:            Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)

        new Product (
                productCode:        CommonConstants.TEST_PRODUCT_CODE_3,
                productName:        CommonConstants.TEST_PRODUCT_NAME_3,
                productDescription: CommonConstants.TEST_PRODUCT_DESC_3,
                productPrice:       CommonConstants.TEST_PRODUCT_PRICE_3,
                company:            Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)

        new Product (
                productCode:        CommonConstants.TEST_PRODUCT_CODE_4,
                productName:        CommonConstants.TEST_PRODUCT_NAME_4,
                productDescription: CommonConstants.TEST_PRODUCT_DESC_4,
                productPrice:       CommonConstants.TEST_PRODUCT_PRICE_4,
                company:            Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)
    }

    private setupUsers() {
        new User (
                firstName:  CommonConstants.TEST_USER_FIRST_NAME_1,
                lastName:   CommonConstants.TEST_USER_LAST_NAME_1,
                company:    Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)

        new User (
                firstName:  CommonConstants.TEST_USER_FIRST_NAME_2,
                lastName:   CommonConstants.TEST_USER_LAST_NAME_2,
                company:    Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)

        new User (
                firstName:  CommonConstants.TEST_USER_FIRST_NAME_3,
                lastName:   CommonConstants.TEST_USER_LAST_NAME_3,
                company:    Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)
                ).save(failOnError: true)
    }
}
