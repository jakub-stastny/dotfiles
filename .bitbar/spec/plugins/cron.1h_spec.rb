require 'spec_helper'

parser = BitBarParser.new('cron.*.rb')

describe parser do
  context 'random day' do
    it 'returns an empty output' do
      output = parser.parse('DATE' => '2017-02-20', 'HOME' => 'spec/data/1')
      expect(output.stderr_lines).to be_empty

      expect(output.title).to be_nil
      expect(output.lines).to be_empty
    end
  end

  context 'first day of a month' do
    it 'returns the wishlist' do
      output = parser.parse('DATE' => '2017-02-01', 'HOME' => File.expand_path('spec/data/1'))
      expect(output.stderr_lines).to be_empty

      expect(output.title).to eql('W')
      expect(output.lines).to include('Bowler hat.')
    end
  end

  context 'every Saturday' do
    it 'returns the research queue if there is anything in it' do
      output = parser.parse('DATE' => '2017-02-18', 'HOME' => File.expand_path('spec/data/1'))
      expect(output.stderr_lines).to be_empty

      expect(output.title).to eql('RQ')
      expect(output.lines).to include('Milongas in Barcelona.')
    end

    it 'returns nothing if the research queue is empty' do
      output = parser.parse('DATE' => '2017-02-18', 'HOME' => File.expand_path('spec/data/2'))
      expect(output.stderr_lines).to be_empty

      expect(output.title).to be_nil
      expect(output.lines).to be_empty
    end
  end
end
