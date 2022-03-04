from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello world in robot custom library")

    @keyword
    def add_items_to_cart_and_checkout(self,productList):
        productTitles = self.selLib.get_webelements("css:.card-title")
        index = 1
        for productTitle in productTitles:
            if productTitle.text in productList:
                self.selLib.click_button("xpath:(//div[@class='card-footer'])["+str(index)+"]/button")
            index = index + 1
        self.selLib.click_link("css:li.active a")