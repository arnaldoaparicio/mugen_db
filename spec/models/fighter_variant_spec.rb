require 'rails_helper'

RSpec.describe FighterVariant, type: :model do
  describe 'relationships' do
    it { should belong_to :fighter}
  end
end
