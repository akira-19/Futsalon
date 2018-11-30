require 'rails_helper'

shared_examples_for 'validate presence' do |column_name|
  #let(:record) { described_class.new }
  #let(:record) { build(factory_name) }
  let(:record) { described_class.new }
  # described_classはテスト対象のクラスを表す。self.described_classでも可


  context "When #{column_name} is blank or nil" do
    before { record[column_name] = nil }

    it 'cannot be saved' do
      expect(record).to be_invalid
    end
  end
end
