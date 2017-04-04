require 'spec_helper'
require 'hydra/groupy/group_adapter_interface'
require 'hydra/groupy/specs/shared_specs/group_adapter_interface'

module Hydra
  module Groupy
    RSpec.describe GroupAdapterInterface do
      let(:adapter) { described_class.new }
      it_behaves_like 'a Hydra::Groupy group adapter interface'
    end
  end
end
