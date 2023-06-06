require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) {User.new}
  let(:category) {Category.new}
  subject { Task.new(title:"test 1", description:"11111111111111",user: user,category: category)}
  it "is valid with title" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description=nil
    expect(subject).to_not be_valid
  end
end
