# Add a declarative step here for populating the DB with movies.
movies_count = 0

Given /the following movies exist/ do |movies_table|

  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
    movies_count += 1
  end
  #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.

  page.body.should =~ /#{title}.*#{director}/m
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  if uncheck
    rating_list.split.each do |rating|
      uncheck "ratings_#{rating}"
    end
  else
    rating_list.split.each do |rating|
      check "ratings_#{rating}"
    end
  end
  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.should has_css?("table#movies tbody tr", :count => movies_count)
  #fail "Unimplemented",
end
