require "rails_helper"

RSpec.describe Mutations::CreateUser do
  describe "#resolve" do
    let(:mutation) { described_class.new(object: nil, context: nil, field: nil) }
    subject { mutation.resolve(args) }
    context "正常系" do
      let(:args) { { name: "test", email: "test@example.com", password: "password", role: "reader" } }
      it do
        expect { subject }.to change { User.count }.by(1)
        expect(subject[:user]).to have_attributes(args)
      end
    end

    context "エラー" do
      let(:args) { { name: "", email: "test@example.com", password: "password", role: "reader" } }
      it do
        expect { subject }.to_not change { User.count }
        expect(subject[:user].errors.messages[:name]).to eq ["can't be blank"]
      end
    end
  end
end