# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  # describe "" do
  #   let(:user) {User.new()}
  #   let(:category) {Category.new(name:"acd")}

  #   let(:task) { Task.new(title: "test 1", description: "11111111111111", user: user.id, category: category.id ) }
  #   it "is valid with title" do
  #     expect(task).to be_valid
  #   end

  #   it "is not valid without a title" do
  #     subject.title=nil
  #     expect(subject).to_not be_valid
  #   end

  #   it "is not valid without a description" do
  #     subject.description=nil
  #     expect(subject).to_not be_valid
  #   end
  #   it { should belongs_to(:category) }
  #   it { should belongs_to(:user) }
  # end
  let(:task) { build(:task) }
end
