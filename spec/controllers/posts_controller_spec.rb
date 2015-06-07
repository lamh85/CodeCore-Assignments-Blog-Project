require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) } # create() is a method from FactoryGirl
  let(:post_1) { create(:post) }
  let(:post_2) { create(:post, user: user)}

  def login(user)
    request.session[:user_id] = user.id
  end

  describe "#create," do
    context "user is signed in," do

      context "with valid parameters," do
        def valid_request
          user # Calls the method let(:user)
          login(user)
          post_2 # Calls the method let(:post_2)
        end

        it "creates a new post" do
          expect { valid_request }.to change {Post.count}.by(1)
          puts "The first name of the post's user is... #{post_1.user.first_name}"
        end # it "creates a new post"

        it "redirects to index page" do
          expect(valid_request).to redirect_to(posts_path)
        end

        it "creates a flash notice" do
          valid_request
          expect(flash[:notice].class).to be
        end

      end # context "with valid parameters"

    end # context "user is signed in: "


  end # describe "#create"


end # RSpec.describe