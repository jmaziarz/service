require 'rails_helper'

describe Report do
  describe "Scopes" do
    before :each do
      @march = Report.create(reported_at: Date.current)
      @april = Report.create(reported_at: Date.current)
    end

    it "returns all that have not been reported" do
      may = Report.create
      expect(Report.not_reported).to include(may)
    end

    it "returns all from auxilliary pioneers" do
      one_aux_pioneer = Report.create(reported_at: Date.current, is_auxilliary_pioneer: true)
      two_aux_pioneer = Report.create(reported_at: Date.current, is_auxilliary_pioneer: true)
      expect(Report.by_auxilliary_pioneers).to include(one_aux_pioneer, two_aux_pioneer)
    end
  end

  it "returns all for a specific month"
  it "returns all for a specific year"
  it "returns all for current month if day is greater than or equal to the 20th"
  it "returns all for previous month if day is less than the 20th"
  it "returns all for publishers not pioneering (regular or auxilliary)"
  it "returns all for regular pioneers"
end
