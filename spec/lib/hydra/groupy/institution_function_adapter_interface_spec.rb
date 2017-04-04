require 'spec_helper'
require 'hydra/groupy/institution_function_adapter_interface'
require 'hydra/groupy/specs/shared_specs/institution_function_adapter_interface'

module Hydra
  module Groupy
    RSpec.describe InstitutionFunctionAdapterInterface do
      let(:adapter) { described_class.new }
      it_behaves_like 'a Hydra::Groupy institution function adapter interface'
    end
  end
end
