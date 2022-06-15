require 'rails_helper'

RSpec.describe Fighter, type: :model do
  describe 'relationships' do
    it { should belong_to :character }
    it { should have_many :fighter_variants }
  end
end
