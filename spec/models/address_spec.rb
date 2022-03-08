require 'rails_helper'
RSpec.describe Address, type: :model do
  subject { Address.new(name: "1 Home street, Cary NC ")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
end