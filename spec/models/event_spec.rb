require 'rails_helper'
RSpec.describe Event, type: :model do
  subject { Event.new(name: "Soccer game", start_time: "4:00 PM", end_time: "5:00 PM" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
end
