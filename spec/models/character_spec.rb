require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'relationships' do
    it { should have_many :fighters }
    it { should validate_presence_of(:origin)  }
    it { should validate_presence_of(:origin_tag) }
  end
end
