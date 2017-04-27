require 'spec_helper'
require 'hydra/grouper/institution_function_value_object'

module Hydra
  module Grouper
    RSpec.describe InstitutionFunctionValueObject do
      subject { described_class.new(name: 'name', key: 'key') }
      it { is_expected.to respond_to(:institution_function_key) }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:key) }

      it 'evaluates equality based on #key' do
        obj1 = described_class.new(name: 'same', key: 'one')
        obj2 = described_class.new(name: 'same', key: 'two')
        obj3 = described_class.new(name: 'other', key: 'one')
        expect(obj1).not_to eq(obj2)
        expect(obj1).to eq(obj3)
      end
    end
  end
end
