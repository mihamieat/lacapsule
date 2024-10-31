describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://www.booking.com/searchresults.fr.html?ss=London%2C+Greater+London%2C+United+Kingdom&ssne=Ifaty&ssne_untouched=Ifaty&efdco=1&label=gen173nr-1FCAEoggI46AdIDVgEaE2IAQGYAQ24AQfIAQ3YAQHoAQH4AQKIAgGoAgO4ArnKjrkGwAIB0gIkZDQ1MWJiNzEtNDQ1YS00ODFiLTk3YWEtMDUzMmMxZTdiNzI12AIF4AIB&aid=304142&lang=fr&sb=1&src_elem=sb&src=index&dest_id=-2601889&dest_type=city&ac_position=0&ac_click_type=b&ac_langcode=en&ac_suggestion_list_length=5&search_selected=true&search_pageview_id=1c076e5c151705ac&ac_meta=GhAxYzA3NmU1YzE1MTcwNWFjIAAoATICZW46BmxvbmRvbkAASgBQAA%3D%3D&checkin=2024-11-11&checkout=2024-11-12&group_adults=2&no_rooms=1&group_children=0')

    // Get all elements with the specific selector for prices
    cy.get('span[data-testid="price-and-discounted-price"]').then(($prices) => {
      // Extract prices, remove currency symbol, and convert to number
      const pricesArray = $prices.toArray().map((el) => {
        const priceText = Cypress.$(el).text().trim(); // Get the text content
        // Check if priceText is not empty and convert to number
        if (priceText) {
          const numericPrice = parseFloat(priceText.replace('€', '').replace('&nbsp;', '').trim()); // Convert to number
          return numericPrice; // Return the numeric price
        }
        return null; // Return null if priceText is empty or invalid
      }).filter(Boolean); // Filter out null values

      // Check if pricesArray is not empty before calculating average
      if (pricesArray.length > 0) {
        const total = pricesArray.reduce((acc, price) => acc + price, 0);
        const averagePrice = total / pricesArray.length;

        // Log the average price to the console
        cy.log(`Average Price: €${averagePrice.toFixed(2)}`);
      } else {
        cy.log("No valid prices found to calculate average.");
      }
    });
  });
});
