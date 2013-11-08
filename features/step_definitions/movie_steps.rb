# Adam Sunshine
# Worked with Chris Acuna, Ryan Donat

# referenced github, stackoverflow, bitbucket


Then /I should see (none|all) of the movies/ do |filter|
  db_size = 0
  db_size = Movie.all.size if filter == "all"
  page.find(:xpath, "//table[@id=\"movies\"]/tbody[count(tr) = #{db_size} ]")
end



Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
   m = Movie.create movie
   m.save!
  end
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  one = (page.body =~ /#{Regexp.quote(e1)}/)
  two = (page.body =~ /#{Regexp.quote(e2)}/)
  one.should be < two
end

When /I (un)?check on the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    if uncheck
      uncheck "ratings_#{rating.strip}"
    else
      check "ratings_#{rating.strip}"
    end
  end
end
