require 'json'

describe AnsibleTowerClient::Project do
  let(:url)                 { "example.com/api/v1/projects" }
  let(:api)                 { AnsibleTowerClient::Api.new(instance_double("Faraday::Connection")) }
  let(:collection)          { api.projects }
  let(:raw_collection)      { build(:response_collection, :klass => described_class) }
  let(:raw_url_collection)  { build(:response_url_collection, :klass => described_class, :url => url) }
  let(:raw_instance)        { build(:response_instance, :project, :klass => described_class) }

  include_examples "Collection Methods"
  include_examples "Crud Methods"
  include_examples "Api Methods"

  it "#initialize instantiates an #{described_class} from a hash" do
    obj = described_class.new(instance_double("AnsibleTowerClient::Api"), raw_instance)

    expect(obj).to              be_a described_class
    expect(obj.id).to           be_a Integer
    expect(obj.url).to          be_a String
    expect(obj.organization).to be_a Integer
    expect(obj.description).to  be_a String
    expect(obj.name).to         be_a String
  end
end
