require "rails_helper"

RSpec.describe Mutations::DeletePost do
  describe "#resolve" do
    let(:user) { Fabricate(:user) }
    let!(:post) { Fabricate(:post, user_id: user.id) }
    let(:args) { { id: post.id } }
    let(:mutation) { described_class.new(object: nil, context: nil, field: nil) }
    subject { mutation.resolve(args) }
    it { expect { subject }.to change { Post.count }.by(-1) }
  end
end