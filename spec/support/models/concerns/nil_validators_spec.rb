require 'rails_helper'

shared_examples_for 'validate presence' do |column_name|
  #let(:record) { described_class.new }
  #let(:record) { build(factory_name) }
  subject(:record) { described_class.new }


  context "#{column_name}が空の時" do
    before { record[column_name] = nil }

    it '保存することができない' do
      expect(record).to be_invalid
    end
  end
end
