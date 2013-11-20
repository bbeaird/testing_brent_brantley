require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    (post.title).should == "New post!"
    post.save
    (post.title).should == "New Post!"
  end

  it "post should be unpublished by default" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    (post.is_published).should == false
  end

  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save
    post.slug.should == "new-post"
  end
end
