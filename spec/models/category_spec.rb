# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  # subject { Category.new(name: "college") }
  # it "is valid with valid name" do
  #   expect(subject).to be_valid
  # end

  # it "is not valid without a name" do
  #   category = Category.new(name: "")
  #   expect(category).to_not be_valid
  # end

  # it { should have_many(:tasks) }
  let(:category) { build(:category) }
end
