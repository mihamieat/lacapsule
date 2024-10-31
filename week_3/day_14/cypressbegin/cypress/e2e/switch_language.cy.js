describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://www.wikipedia.org')
    cy.get('#js-lang-list-button').click()
    cy.wait(4)
    cy.get('a[href="//pl.wikipedia.org/"]').click();
  })
})
