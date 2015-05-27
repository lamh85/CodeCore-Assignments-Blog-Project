require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:post_1 ) { create(:post, user: user)}

  describe "#create: " do
    context "user is signed in: " do
      before { login(user) }

      context "with valid parameters: " do

        def valid_request
          post :create, :post
        end

        it "creates a new post" do
          expect { valid_request }.to change {Post.count}.by(1)
        end # it "creates a new post"

      end # context "with valid parameters"

    end # context "user is signed in: "


  end # describe "#create"


end # RSpec.describe