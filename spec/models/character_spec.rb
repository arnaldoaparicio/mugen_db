require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'relationships' do
    it { should have_many :fighters }
  end
end
