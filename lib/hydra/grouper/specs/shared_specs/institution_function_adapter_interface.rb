RSpec.shared_examples 'a Hydra::Grouper institution function adapter interface' do
  before do
    raise 'adapter must be set with `let(:adapter)`' unless
      defined? adapter
  end
  it { is_expected.to respond_to(:all_institution_functions) }
  describe '#all_institution_functions' do
    it 'requires no parameters' do
      expect(adapter.method(:all_institution_functions).parameters).to eq([])
    end
  end
  it { is_expected.to respond_to(:institution_functions_for) }
  describe '#institution_functions_for' do
    it 'requires a user: keyword arg' do
      expect(adapter.method(:institution_functions_for).parameters).to eq([[:keyreq, :user_key]])
    end
  end

  it { is_expected.to respond_to(:members_of) }
  describe '#members_of' do
    it 'requires a user: keyword arg' do
      expect(adapter.method(:members_of).parameters).to eq([[:keyreq, :institution_function_key]])
    end
  end
end
