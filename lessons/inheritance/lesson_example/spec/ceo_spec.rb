require './lib/ceo'
require './lib/employee'


RSpec.describe Ceo do

  describe "setup" do
    it "exists" do
      ceo = Ceo.new(15,20,"Steve", 1234)
    end
    it "has base_salary and bonus attributes" do
      ceo = Ceo.new(15,20,"Steve", 1234)
      expect(ceo.base_salary).to eq(15)
      expect(ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    it 'has name and id number and total compensation' do
      ceo = Ceo.new(15,20,"Steve", 1234)
      expect(ceo.name).to eq('Steve')
      expect(ceo.id).to eq(1234)
      expect(ceo.total_compensation).to eq(35)
    end

    it 'is an Employee and CEO' do
      ceo = Ceo.new(15,20,"Steve", 1234)
      
      expect(ceo.is_a? Ceo).to be true
      expect(ceo.is_a? Employee).to be true
    end

    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
  end

end