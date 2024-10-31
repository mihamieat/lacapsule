describe('Wikipedia', () => {
  it('Search for content', () => {
    cy.visit('https://www.wikipedia.org')
    cy.get("input[type='search']")
    cy.contains("text")
    cy.get("input[type='search']").type("DevOps{enter}");
    cy.contains("DevOps");
  })
})
