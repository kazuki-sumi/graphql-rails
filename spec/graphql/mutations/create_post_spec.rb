require "rails_helper"

RSpec.describe Mutations::CreatePost do
  describe "#resolve" do
    let(:mutation) { described_class.new(object: nil, context: nil, field: nil) }
    let(:user) { Fabricate(:user) }
    subject { mutation.resolve(args) }
    context "正常系" do
      let(:args) { { title: "テストタイトル", description: "テスト概要", status: 1, user_id: user.id } }
      it do
        expect { subject }.to change { Post.count }.by(1)
        expect(subject[:post]).to have_attributes(args)
      end
    end

    context "エラー" do
      let(:args) { { title: "", description: "テスト概要", status: 1, user_id: user.id } }
      it do
        expect { subject }.to_not change { Post.count }
        expect(subject[:post].errors.messages[:title]).to eq ["can't be blank"]
      end
    end
  end
end