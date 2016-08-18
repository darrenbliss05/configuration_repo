require 'spec_helper'
describe 'bar' do
  context 'with default values for all parameters' do
    it { should contain_class('bar') }
  end
end
