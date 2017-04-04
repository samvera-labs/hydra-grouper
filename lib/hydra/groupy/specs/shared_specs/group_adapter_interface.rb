RSpec.shared_examples 'a Hydra::Groupy group adapter interface' do
  before do
    raise 'adapter must be set with `let(:adapter)`' unless
      defined? adapter
  end
  it { is_expected.to respond_to(:all_groups) }
  describe '#all_groups' do
    it 'requires no parameters' do
      expect(adapter.method(:all_groups).parameters).to eq([])
    end
  end
  it { is_expected.to respond_to(:groups_for) }
  describe '#groups_for' do
    it 'requires a user: keyword arg' do
      expect(adapter.method(:groups_for).parameters).to eq([[:keyreq, :user]])
    end
  end
end
