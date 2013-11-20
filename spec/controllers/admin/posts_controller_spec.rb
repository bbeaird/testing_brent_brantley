require 'spec_helper'

describe Admin::PostsController do
  let(:post_params) { { title: "Sample title", content: "Sample content." } }

  describe "admin panel" do
    it "#index" do
      get :index
      response.status.should eq 200
    end

    it "#new" do
      get :new
      response.status.should eq 200
      p expect(assigns(:post)).to be_a_new(Post)
      # p :post
      # p assigns(:post)
    end

    context "#create" do
      it "creates a post with valid params" do
        p "9"*80
        p post :create, post: post_params
        # p post_params
        p "9"*80
        # p response
        response.status.should eq(302)

        # ????
        # expect(assigns(:post).title).to eq "Sample content."
      end

      it "doesn't create a post when params are invalid" do
        post :create, post: {title: "Sample content."}
        response.status.should eq 200
        # expect(assigns(:post).errors.messages).to_not be_empty
      end

    end

    context "#edit" do
      it "updates a post with valid params" do
        post_ob = Post.create(post_params)
        put :update, id: post_ob.id, post: { title: "Updated title bitch!" }
        expect(assigns(:post).title).to eq("Updated Title Bitch!")
      end
      it "doesn't update a post when params are invalid" do
        post_ob = Post.create(post_params)
        put :update, id: post_ob.id, post: { title: nil }
        expect(assigns(:post).errors.messages).to_not be_empty
        response.status.should eq 200
      end
    end

    xit "#destroy" do
      post_ob = Post.create(post_params)
      delete :destory, id: post_ob.id
      response.status.should eq 302
    end
  end
end
