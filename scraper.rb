# scraper.rb
require 'nokogiri'
require 'open-uri'
require 'awesome_print'

# filter links
def filter_links(results)
  dogs = []

  # regex for words matching "pup", "puppy", "puppies", or "dog"
  # e.g. dog_regex = ...
  ## YOUR CODE HERE
  dog_regex = /\bdog|\bpupp?y?(ies)?/i
  # regex for words matching "house", "item", "boots", "walker", or "sitter"
  # e.g. item_regex = ...
  ## YOUR CODE HERE
  item_regex = /house|item|boots|walker|sitter/i
  # filter results that match `dog_regex` and DO NOT match `item_regex`
  # Hint: you'll want to iterate through `results` and push each result
  # into `dogs` array if it meets the regex requirements
  ## YOUR CODE HERE
  results.each do |result|
    # puts result
    # puts result[:title].match(dog_regex) == nil
    if !(result[:title].match(dog_regex) == nil ) && (result[:title].match(item_regex) == nil)
      if result[:image] == "pic" || result[:image] == "pic map"
        dogs << result
      end
    end
  end
  # return dogs array
  dogs
end

# get today's results
def get_todays_results(results, date_str)
  todays_results = []

  # iterate through each result and push it into `todays_results`
  # if date matches `date_str`
  results.each do |result|
    if result[:date] == date_str
      todays_results.push(result)
    end
  end

  # comment out below to see today's results before filter
  filter_links(todays_results)

  # comment in below to see today's results before filter
  # todays_results
end

# get all page results from craigslist
def get_page_results(date_str)
  url = "http://sfbay.craigslist.org/sfc/pet"
  page = Nokogiri::HTML(open(url))

  # map page elements to a hash with date, title, location
  all_rows = page.css(".row .txt").map do |row| {
    date: row.css(".pl time").text,
    title: row.css(".pl a").text,
    location: row.css(".l2 .pnr small").text,
    image: row.css("span.p").text.strip!
  }
  end

  get_todays_results(all_rows, date_str)
end

# search function
def search(date_str)
  get_page_results(date_str)
end

# learn more about time in ruby:
# http://www.ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html#strftime-method
today = Time.now.strftime("%b %d")

# call search function with today's date
ap search(today)
