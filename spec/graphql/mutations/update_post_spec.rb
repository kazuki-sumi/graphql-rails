require "rails_helper"

RSpec.describe Mutations::UpdatePost do
  describe "#resolve" do
    let(:user) { Fabricate(:user) }
    let!(:post) { Fabricate(:post, user_id: user.id) }
    let(:mutation) { described_class.new(object: nil, context: nil, field: nil) }
    subject { mutation.resolve(args) }
    context "正常系" do
      let(:args) { { id: post.id, title: "アップデートタイトル" } }
      it { expect { subject }.to change { post.reload.title }.from("テストタイトル").to("アップデートタイトル") }
    end
  end
end