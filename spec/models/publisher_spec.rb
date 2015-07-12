require 'rails_helper'

describe Publisher do
  it "is valid with a first_name and last_name" do
    publisher = Publisher.new(first_name: 'James', last_name: 'Jones')
    expect(publisher).to be_valid
  end

  it "is invalid without a first_name" do
    publisher = Publisher.new(first_name: nil)
    publisher.valid?
    expect(publisher.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last_name" do
    publisher = Publisher.new(last_name: nil)
    publisher.valid?
    expect(publisher.errors[:last_name]).to include("can't be blank")
  end

  it "returns only inactive" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    judas = Publisher.create(first_name: 'Judas', last_name: 'Iscariot', is_inactive: true)
    expect(Publisher.inactive.count).to eq 1
  end

  it "returns only active" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    judas = Publisher.create(first_name: 'Judas', last_name: 'Iscariot', is_inactive: true)
    expect(Publisher.active.count).to eq 2
  end

  it "returns only pioneers" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    julie = Publisher.create(first_name: 'Julie', last_name: 'Inservice', is_pioneer: true)
    expect(Publisher.pioneers.count).to eq 1
  end

  it "returns only elders" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    billy = Publisher.create(first_name: 'Billy', last_name: 'Shepherd', is_elder: true)
    expect(Publisher.elders.count).to eq 1
  end

  it "returns only servants" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    johny = Publisher.create(first_name: 'Johny', last_name: 'Assistant', is_servant: true)
    expect(Publisher.servants.count).to eq 1
  end

  it "returns only elders and servants (appointed)" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    billy = Publisher.create(first_name: 'Billy', last_name: 'Shepherd', is_elder: true)
    johny = Publisher.create(first_name: 'Johny', last_name: 'Assistant', is_servant: true)
    expect(Publisher.appointed.count).to eq 2
  end

  it "returns all active except pioneers" do
    james = Publisher.create(first_name: 'James', last_name: 'Jones')
    peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    julie = Publisher.create(first_name: 'Julie', last_name: 'Inservice', is_pioneer: true)
    expect(Publisher.not_pioneering.count).to eq 2
  end

  it "returns true if sum of last six months hours is greater than zero"
  it "is valid when a male is an elder or servant"
  it "is invalid when a female is an elder of servant"
end
