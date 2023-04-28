it("There is products on the page", () => {
  cy.visit('/')
  cy.get(".products article").should("be.visible");
});

it("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 2);
}); 

it("Users can navigate from the home page to the product detail page by clicking on a product", () => {
  cy.get(".products img").first().click()
}); 

it("There is a product description on the product page", () => {
  cy.get(".product-detail").should("exist");
}); 
