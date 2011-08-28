import inventorysystem.*

class BootStrap {

	def init = { servletContext ->
		
		def testDataSetup = new TestDataSetup()

		environments{
			development{
                // Assume that if the Company was not setup, database is still empty
                if (Company.findByCompanyName(CommonConstants.TEST_COMPANY_NAME)==null) {
                    testDataSetup.setupTestData()                    
                }
			}

			production{
			}
			test{
			}
		}

	}
	def destroy = {
	}
}
