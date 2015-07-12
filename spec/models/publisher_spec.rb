require 'rails_helper'

describe Publisher do
  describe "Validations" do
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
  end

  describe "Scopes" do
    before :each do
      @james = Publisher.create(first_name: 'James', last_name: 'Jones')
      @peter = Publisher.create(first_name: 'Peter', last_name: 'Smith')
    end

    it "returns only inactive" do
      judas = Publisher.create(first_name: 'Judas', last_name: 'Iscariot', is_inactive: true)
      expect(Publisher.inactive).to include(judas)
    end

    it "returns only active" do
      judas = Publisher.create(first_name: 'Judas', last_name: 'Iscariot', is_inactive: true)
      expect(Publisher.active).to include(@james, @peter)
    end

    it "returns only pioneers" do
      julie = Publisher.create(first_name: 'Julie', last_name: 'McService', is_pioneer: true)
      expect(Publisher.pioneers).to include(julie)
    end

    it "returns only elders" do
      billy = Publisher.create(first_name: 'Billy', last_name: 'Shepherd', is_elder: true)
      expect(Publisher.elders).to include(billy)
    end

    it "returns only servants" do
      johny = Publisher.create(first_name: 'Johny', last_name: 'Assistant', is_servant: true)
      expect(Publisher.servants).to include(johny)
    end

    it "returns only elders and servants (appointed)" do
      billy = Publisher.create(first_name: 'Billy', last_name: 'Shepherd', is_elder: true)
      johny = Publisher.create(first_name: 'Johny', last_name: 'Assistant', is_servant: true)
      expect(Publisher.appointed).to include(billy, johny)
    end

    it "returns all active except pioneers" do
      julie = Publisher.create(first_name: 'Julie', last_name: 'McService', is_pioneer: true)
      expect(Publisher.not_pioneering).to include(@james, @peter)
    end
  end

  it "returns true if sum of last six months hours is greater than zero"
  it "is valid when a male is an elder or servant"
  it "is invalid when a female is an elder of servant"
  it "generates username from first_name, last_name, and middle_name"
end
