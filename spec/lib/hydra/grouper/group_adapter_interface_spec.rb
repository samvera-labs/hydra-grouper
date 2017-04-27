require 'spec_helper'
require 'hydra/grouper/group_adapter_interface'
require 'hydra/grouper/specs/shared_specs/group_adapter_interface'

module Hydra
  module Grouper
    RSpec.describe GroupAdapterInterface do
      let(:adapter) { described_class.new }
      it_behaves_like 'a Hydra::Grouper group adapter interface'
    end
  end
end
