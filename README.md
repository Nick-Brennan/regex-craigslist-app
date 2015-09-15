# Scrape CraigsList with Nokogiri & Regex

Your task is to write a **Puppy Scraper**. Your scraper will search Craigslist for all pets in the SF area and use regex to return the date, title, and location for any posting that matches the words "pup", "puppy", "puppies", or "dog".

<img src="http://xrdj144og6l4bdn0u3zy34o9.wpengine.netdna-cdn.com/wp-content/uploads/2015/04/Gorgeous_puppies.jpg">

## Challenges

1. Use regex to only return results where the title matches "pup", "puppy", "puppies", or "dog".

2. In addition to matching the keywords above, only return results where the title DOES NOT include "house", "item", "boots", "walker", or "sitter".

3. **Bonus:** Only return results that have an image.
  * **Hint:** This will involve scraping an extra page element in `get_page_results` as well as updating the logic in `filter_links`. You will need to visit <a href="http://sfbay.craigslist.org/sfc/pet" target="_blank">http://sfbay.craigslist.org/sfc/pet</a> in the browser and use `Inspect Element` to find the page element containing the image flag ("pic").

## How to Get Started

1. Fork this repo, and clone it onto your local machine.
2. From the terminal, run `ruby scraper.rb`.
3. Your program returns an empty array (`dogs`). Your goal is to edit the `filter_links` method to add results to the `dogs` array based on the regex matching you write.
  * To see the all results scraped from Craigslist before filling out `filter_links`, **comment out** line 39 and **comment in** line 42.