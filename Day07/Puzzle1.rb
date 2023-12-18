class Hand include Comparable
  def initialize(str, bid)
    @str = str
    @bid = bid
  end

  def get_bid
    return @bid
  end

  def get_str
    return @str
  end

  def <=> (hand)
    equals = 0
    @str.split("").zip(hand.get_str.split("")).each do |char1, char2|
      if HashPower[char1] > HashPower[char2]
        return 1
      end
      if HashPower[char1] < HashPower[char2]
        return -1
      end
    end
    return 0
  end

  def type
    hash_cards = {}
    @str.split("").each do |char|
        if hash_cards.keys.include?(char)
            hash_cards[char] = hash_cards[char] + 1
        else
            hash_cards[char] = 1
        end
    end
    pairs = 0
    three_equals = 0
    hash_cards.keys.each do |key|
        if(hash_cards[key] == 5)
            return "five of a kind"
        end
        if(hash_cards[key] == 4)
            return "four of a kind"
        end
        if(hash_cards[key] == 3)
            three_equals += 1
        end
        if(hash_cards[key] == 2)
            pairs += 1
        end
    end
    if(three_equals == 1)
        if (pairs == 1)
            return "full house"
        else
            return "three of a kind"
        end
    end
    if(pairs == 2)
        return "two pairs"
    end
    if(pairs == 1)
        return "one pair"
    end
    return "high card"
  end
end

def quick_sort(list)
    return [] if list.empty?
    groups = list.group_by { |n| n <=> (list.first) }
    less_than    = groups[-1] || []
    first        = groups[0]  || []
    greater_than = groups[1]  || []
    quick_sort(less_than) + first + quick_sort(greater_than)
  end
  

HashPower = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" =>14}

hash_hands = {}
File.foreach("Day07/Input.txt"){
    |line|
    hand = Hand.new(line.split[0], line.split[1].to_i)
    if hash_hands[hand.type].nil?
        hash_hands[hand.type] = []
    end
    hash_hands[hand.type] += [hand]
}
hash_hands.keys.each do |key| 
    hash_hands[key] = quick_sort(hash_hands[key])
end
ranking = 0
sum = 0 
if !hash_hands["high card"].nil?
    hash_hands["high card"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking
    end
end
if !hash_hands["one pair"].nil?
    hash_hands["one pair"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking
    end
end
if !hash_hands["two pairs"].nil?
    hash_hands["two pairs"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking
    end
end
if !hash_hands["three of a kind"].nil?
    hash_hands["three of a kind"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking
    end
end
if !hash_hands["full house"].nil?
    hash_hands["full house"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking   
    end
end
if !hash_hands["four of a kind"].nil?
    hash_hands["four of a kind"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking
    end
end
if !hash_hands["five of a kind"].nil?
    hash_hands["five of a kind"].each do |card|
        ranking += 1
        sum += card.get_bid * ranking
    end
end
p sum