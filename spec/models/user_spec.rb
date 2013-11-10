require 'spec_helper'

describe User do

  describe ".top_rated" do
    before :each do
      post = nil
      topic = create(:topic)
      @u0 = create(:user) do |user|
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end

      @u1 = create(:user) do |user|
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end

      @u2 = create(:user) do |user|
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end
    end

    it "should return users based on comments + posts" do
      User.top_rated.should eq([@u2, @u1, @u0])
    end

    it "should have 'posts_count' on user" do
      users = User.top_rated
      users.first.posts_count.should eq(1)
    end
    it "should have 'comments_count' on user" do
      users = User.top_rated
      users.first.comments_count.should eq(3)
    end
  end

  describe "role?" do
    before :each do
      @u0 = create(:user) do |user|
        u = user.role.build(attributes_for(:role))
        user.role = role
        u.save
      end
    end

    it "should have 'role' on user" do
      users = User.set_member
      users.role?.should eq(!nil)
    end
  end


end


