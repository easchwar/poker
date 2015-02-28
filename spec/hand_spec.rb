require 'hand.rb'
require 'rspec'

RSpec.describe Hand do
  subject(:two_s) { Card.new(:two, :spades) }
  subject(:two_c) { Card.new(:two, :clubs) }
  subject(:two_d) { Card.new(:two, :diamonds) }
  subject(:two_h) { Card.new(:two, :hearts) }
  subject(:three) { Card.new(:three, :spades) }
  subject(:four) { Card.new(:four, :spades) }
  subject(:five) { Card.new(:five, :spades) }
  subject(:six) { Card.new(:six, :spades) }
  subject(:six_d) { Card.new(:six, :diamonds) }
  subject(:jack) { Card.new(:jack, :spades) }
  subject(:hand) { Hand.new([1, 2, 3, 4, 5]) }

  describe "::initialize" do
    it "should accept argument correctly" do
      cards = [1,2,3,4,5]
      expect(hand.cards).to eq(cards)
    end
  end

  describe "discard" do
    it "should removes cards from hand" do
      hand.discard([1,2,3])
      expect(hand.cards).to eq([4,5])
    end
    it "should throw an error if you try to discard card you dont have" do
      expect {hand.discard([7])}.to raise_error
    end
  end

  describe "#add_cards" do
    it "takes cards from a deck" do
      hand.add_cards([6,7])
      expect(hand.cards).to eq([1,2,3,4,5,6,7])
    end
  end

  describe "[calculates hands correctly]" do
    subject(:flush) { Hand.new([two_s, five, three, six, jack]) }
    subject(:straight) { Hand.new([two_c, four, five, three, six]) }
    subject(:s_flush) { Hand.new([two_s, three, four, five, six]) }
    subject(:two_kind) { Hand.new([two_c, two_s, four, five, jack]) }
    subject(:two_pair) { Hand.new([two_c, two_s, six, six_d, jack]) }
    subject(:three_kind) { Hand.new([two_c, three, two_d, five, two_h]) }
    subject(:four_kind) { Hand.new([two_c, three, two_h, two_d, two_s]) }
    subject(:full_house) { Hand.new([two_c, six_d, two_h, two_s, six]) }

    context "#highest_hand" do
      it "returns highest rank of your hand" do
        expect(flush.highest_hand).to eq(4)
        expect(s_flush.highest_hand).to eq(1)
        expect(full_house.highest_hand).to eq(3)
      end
    end

    context "#flush?" do
      it "returns true for a flush" do
        expect(flush).to be_flush
      end
      it "returns false for anything else" do

        expect(straight).to_not be_flush
      end
    end

    context "#straight?" do
      it "returns true for a straight" do
        expect(straight).to be_straight
      end

      it "returns false for anything else" do
        expect(flush).to_not be_straight
      end
    end

    context "#straight_flush?" do
      it "returns true for a straight flush" do
        expect(s_flush).to be_straight_flush
      end

      it "returns false for anything else" do
        expect(flush).to_not be_straight_flush
        expect(straight).to_not be_straight_flush
      end
    end

    context "#pair?" do
      it "returns true for a pair" do
        expect(two_kind).to be_pair
      end

      it "returns false for anything else" do
        expect(three_kind).to_not be_pair
      end
    end

    context "#two_pair?" do
      it "returns true for a pair" do
        expect(two_pair).to be_two_pair
      end

      it "returns false for anything else" do
        expect(two_kind).to_not be_two_pair
      end
    end

    context "#three_of_a_kind?" do
      it "returns true for a three_of_a_kind" do
        expect(three_kind).to be_three_of_a_kind
      end

      it "returns false for anything else" do
        expect(two_kind).to_not be_three_of_a_kind
      end
    end

    context "#four_of_a_kind?" do
      it "returns true for a four_of_a_kind" do
        expect(four_kind).to be_four_of_a_kind
      end

      it "returns false for anything else" do
        expect(three_kind).to_not be_four_of_a_kind
      end
    end

    context "#full_house?" do
      it "returns true for a full_house" do
        expect(full_house).to be_full_house
      end

      it "returns false for anything else" do
        expect(three_kind).to_not be_full_house
      end
    end
  end
end
