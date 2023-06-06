require 'rails_helper'

RSpec.describe Category, type: :model do

  subject {Category.new(name:"college")}
  it "is valid with valid name" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end

end
