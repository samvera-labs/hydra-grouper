require 'spec_helper'
require 'hydra/groupy/institution_function_value_object'

module Hydra
  module Groupy
    RSpec.describe InstitutionFunctionValueObject do
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
