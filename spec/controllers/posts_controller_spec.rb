require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:post_1 ) { create(:post, user: user)}

  describe "#create: " do
    context "user is signed in: " do

      def valid_request
      end

    end # context "user is signed in: "


  end # describe "#create"


end # RSpec.describe