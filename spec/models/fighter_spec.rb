require 'rails_helper'

RSpec.describe Fighter, type: :model do
  describe 'relationships' do
    it { should belong_to :character }
    it { should have_many :fighter_variants }
    it { should validate_presence_of :name}
  end
end
