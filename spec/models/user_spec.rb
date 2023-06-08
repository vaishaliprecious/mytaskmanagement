# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # subject { User.new(firstname: "rammm", lastname: "Smith",password:"123456" , email: "jsmith@sample.com" )}
  # it "is valid with valid firstname" do
  #   expect(subject).to be_valid
  # end
  # it "is not valid without a firstname" do
  #   subject.firstname=nil
  #   expect(subject).to_not be_valid
  # end
  # it "is valid with valid lastname" do
  #   expect(subject).to be_valid
  # end
  # it "is not valid without a lastname" do
  #   subject.lastname=nil
  #   expect(subject).to_not be_valid
  # end
  # it "is valid with valid password" do
  #   expect(subject).to be_valid
  # end
  # it "is not valid without a password" do
  #   subject.password=nil
  #   expect(subject).to_not be_valid
  # end
  # it "is valid with valid email" do
  #   expect(subject).to be_valid
  # end
  # it "is not valid without a email" do
  #   subject.email=nil
  #   expect(subject).to_not be_valid
  # end
  let(:user) { build(:user) }
end
