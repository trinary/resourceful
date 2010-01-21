require File.join(File.dirname(__FILE__), "spec_helper")

describe "Simple API" do

  it 'should get' do
    doc = Resourceful.get(TEST_SERVER + "/")

    doc.should_not be_nil
    doc.should be_a(Hash)
    pp doc
  end

end
