require 'spec_helper'
require 'hydra/grouper/institution_function_adapter_interface'
require 'hydra/grouper/specs/shared_specs/institution_function_adapter_interface'

module Hydra
  module Grouper
    RSpec.describe InstitutionFunctionAdapterInterface do
      let(:adapter) { described_class.new }
      it_behaves_like 'a Hydra::Grouper institution function adapter interface'
    end
  end
end
