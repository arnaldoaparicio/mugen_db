require 'rails_helper'

RSpec.describe FighterVariant, type: :model do
  describe 'relationships' do
    it { should belong_to :fighter }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :author }
    it { should validate_presence_of :website }
    it { should validate_presence_of :game_name }
  end
end
