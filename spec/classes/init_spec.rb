require 'spec_helper'
describe 'maxscale' do

  context 'with defaults for all parameters' do
    it { should contain_class('maxscale') }
  end
end
