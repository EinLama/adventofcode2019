require_relative "../day4"

describe "day4" do
  context "detecting doubles" do
    it "extracts doubles if present" do
      expect(doubles("aabb")).to eq(["a", "b"])
    end

    it "extracts doubles only if next to each other" do
      expect(doubles("iixzxxababYY")).to eq(["i", "x", "Y"])
      expect(doubles("abba")).to eq(["b"])

      expect(doubles("abab")).to eq([])
    end
  end

  context "valid ranges" do
    it "is valid with all ones" do
      expect(valid_password?("111111")).to be_truthy
    end

    it "is only valid with 6 digits" do
      expect(valid_password?("1111")).to be_falsy # 4 digits
      expect(valid_password?("11111")).to be_falsy # 5 digits
      expect(valid_password?("1111111")).to be_falsy # 7 digits
      expect(valid_password?("11111111")).to be_falsy # 8 digits
    end

    it "is valid when increasing (or staying same) and with at least one pair" do
      expect(valid_password?("123345")).to be_truthy
    end

    it "is not valid with decreasing numbers" do
      expect(valid_password?("223450")).to be_falsy
    end

    it "is not valid without doubles" do
      expect(valid_password?("123789")).to be_falsy
    end
  end
end
