it("There is products on the page", () => {
  cy.visit('/')
  cy.get(".products article").should("be.visible");
});

it("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 2);
}); 

it("Shopping cart is empty", () => {
  cy.get('.nav-link ').contains("My Cart (0)")
}); 

it("Users can navigate from the home page to the product detail page by clicking on a product", () => {
  cy.get('.products .btn').first().click({ force: true })
});  

it("Shopping cart has added an item", () => {
  cy.get('.nav-link ').contains("My Cart (1)")
}); 
