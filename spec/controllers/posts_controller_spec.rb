require 'rails_helper'
require 'byebug'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) } # create() is a method from FactoryGirl
  let(:post_1) { create(:post) }
  let(:post_2) { create(:post, user: user)}

  # def login(user)
  #   request.session[:user_id] = user.id
  # end

  describe "#create," do
    context "user is signed in," do
      before { sign_in(user) } # sign_in is a method from Devise
      context "with valid parameters," do
        def valid_request
          post :create, { post: {title: "Hello There", user_id: user }}
          # user # Calls the method let(:user)
          # login(user)
          # post_2 # Calls the method let(:post_2)
        end

        it "creates a new post" do
          expect { valid_request }.to change {Post.count}.by(1)
        end # it "creates a new post"

        it "redirects to index page" do
          valid_request
          expect(response).to redirect_to(posts_path)
        end

        it "creates a flash notice" do
          valid_request
          expect(flash[:notice]).to eq("Post successfully saved!")
        end

      end # context "with valid parameters"

      context "withOUT valid parameters," do
        def invalid_request
          post :create, { post: {title: nil, user_id: user }}
        end

        it "does NOT add a new record in database" do
          expect{invalid_request}.to change {Post.count}.by(0)
        end

        it "renders the 'new post' page" do
          invalid_request
          expect(response).to render_template(:new)
        end

        it "creates a flash alert" do
          invalid_request
          expect(flash[:alert]).to eq("We could not post your blog")
        end

      end # context "without valid parameters"

    end # context "user is signed in: "


  end # describe "#create"


end # RSpec.describe