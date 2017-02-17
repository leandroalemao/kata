require 'pry'

def price(goods)
  co = CheckOut.new(RULES)
  goods.split(//).each { |item| co.scan(item) }
  co.total
end

describe 'CodeKata' do
  describe 'test_totals' do
    it 'returns 0 for price("")' do
      expect(price("")).to eq(0)
    end

    it 'returns 50 for price("A")' do
      expect(price("A")).to eq(50)
    end

    it 'returns 80 for price("AB")' do
      expect(price("AB")).to eq(80)
    end

    it 'returns 80 for price("CDBA")' do
      expect(price("CDBA")).to eq(115)
    end

    it 'returns 100 for price("AA")' do
      expect(price("AA")).to eq(100)
    end

    it 'returns 130 for price("AAA")' do
      expect(price("AAA")).to eq(130)
    end

    it 'returns 180 for price("AAAA")' do
      expect(price("AAAA")).to eq(180)
    end

    it 'returns 230 for price("AAAAA")' do
      expect(price("AAAAA")).to eq(230)
    end

    it 'returns 260 for price("AAAAAA")' do
      expect(price("AAAAAA")).to eq(260)
    end

    it 'returns 160 for price("AAAB")' do
      expect(price("AAAB")).to eq(160)
    end

    it 'returns 175 for price("AAABB")' do
      expect(price("AAABB")).to eq(175)
    end

    it 'returns 190 for price("AAABBD")' do
      expect(price("AAABBD")).to eq(190)
    end

    it 'returns 190 for price("DABABA")' do
      expect(price("DABABA")).to eq(190)
    end
  end

  it 'test_incremental' do
    co = CheckOut.new(RULES)
    expect(co.total).to eq(0)
    co.scan("A");
    expect(co.total).to eq(50)
    co.scan("B");
    expect(co.total).to eq(80)
    co.scan("A");
    expect(co.total).to eq(130)
    co.scan("A");
    expect(co.total).to eq(160)
    co.scan("B");
    expect(co.total).to eq(175)
  end
end
