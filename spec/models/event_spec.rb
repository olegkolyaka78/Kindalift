require 'rails_helper'
RSpec.describe Event, type: :model do
  subject { Event.new(name: "Soccer game", start_time: "4:33 AM", end_time: "4:33 PM" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
    expect(subject.phone.length).to_not eq(11)
  end
  it "is not valid if the phone number is not all digits" do
    expect(subject.phone).to_not be_kind_of(Numeric)
  end
  it "is not valid if the email address doesn't have a @" do
    expect(subject.to_s).to_not include("@")
  end
  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Jack Smith")
  end
end
