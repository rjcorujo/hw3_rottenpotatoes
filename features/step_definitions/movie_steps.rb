

# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  index1 = page.html.index(e1)
  index2 = page.html.index(e2)
  assert index1 != nil && index2 != nil && index1 < index2, "failed"
end

Then /I should not see any movies/ do 
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  Movie.all.each do |mv|
    step "I should not see \"#{mv.title}\""
  end  
end

Then /I should see all of the movies/ do 
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  Movie.all.each do |mv|
    step "I should see \"#{mv.title}\""
  end  
end
# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |rating|
    if uncheck
      step "uncheck \"ratings_#{rating}\""
    else
      step "check \"ratings_#{rating}\""
    end
  end
end
