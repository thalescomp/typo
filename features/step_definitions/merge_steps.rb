require 'debugger'

Given /^the following articles exist:$/ do |table|
    # table is a Cucumber::Ast::Table
    Article.create table.hashes
end

Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
    Article.find_by_title(title).body.should eq body
end

Then /^the article "(.*?)" should have the author "(.*?)"$/ do |title, author|
    Article.find_by_title(title).author.should eq author
end

Given /^the following comments exist:$/ do |table|
    # table is a Cucumber::Ast::Table
    table.hashes.each do |comment|
        art = Article.find(comment['article_id'])
        art.add_comment(comment).save
    end
end

Then /^the comment "(.*?)" belongs to "(.*?)" article$/ do |c_title, a_title|
    Comment.find_by_title(c_title).article_id.should eq Article.find_by_title(a_title).id
end