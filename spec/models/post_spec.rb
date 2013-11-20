require 'spec_helper'

describe Post do

  let (:post) do
    Post.new :title => "New post!",
             :content => "A great story"
  end

  it "title should be automatically titleized before save" do
    (post.title).should == "New post!"
    post.save
    (post.title).should == "New Post!"
  end

  it "post should be unpublished by default" do
    (post.is_published).should == false
  end

  it "slug should be automatically generated" do
    post.slug.should be_nil
    post.save
    post.slug.should == "new-post"
  end
end
