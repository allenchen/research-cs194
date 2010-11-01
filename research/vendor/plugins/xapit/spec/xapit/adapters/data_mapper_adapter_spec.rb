require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Xapit::DataMapperAdapter do
  it "should be used for DataMapper::Resource model" do
    Xapit::DataMapperAdapter.should_not be_for_class(Object)
    klass = Object.new
    stub(klass).ancestors { ["DataMapper::Resource"] }
    Xapit::DataMapperAdapter.should be_for_class(klass)
  end
end
