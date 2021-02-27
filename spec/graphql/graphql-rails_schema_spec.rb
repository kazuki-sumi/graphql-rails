require "rails_helper"

RSpec.describe GraphqlRailsSchema do
  describe "" do
    let(:current_defn) { GraphqlRailsSchema.to_definition }
    let(:printout_defn) { File.read(Rails.root.join("app/graphql/schema.graphql")) }
    it { expect(printout_defn).to eq current_defn }
  end
end
