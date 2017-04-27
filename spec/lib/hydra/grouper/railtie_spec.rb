require 'spec_helper'
require 'hydra/grouper/railtie'

module Hydra
  module Grouper
    RSpec.describe Railtie do
      context '.config' do
        let(:railtie) { described_class }
        let(:config) { railtie.config }
        context '.eager_load_namespaces' do
          subject { config.eager_load_namespaces }
          it { is_expected.not_to include(Hydra::Grouper) }
        end
        context '.to_prepare_blocks' do
          subject { config.to_prepare_blocks }
          it { is_expected.not_to be_empty }
          it 'will configure the indexer when called' do
            expect(Hydra::Grouper).to receive(:configure!)
            config.to_prepare_blocks.each(&:call)
          end
        end
      end
    end
  end
end
