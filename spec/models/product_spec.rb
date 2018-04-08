require 'rails_helper'

RSpec.describe Product, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:width) }
  it { should validate_presence_of(:lenght) }
  it { should validate_presence_of(:price) }

  it { should validate_numericality_of(:height) }
  it { should validate_numericality_of(:width) }
  it { should validate_numericality_of(:lenght) }
end
