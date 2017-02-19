require 'spec_helper'

parser = BitBarParser.new('info.*.rb')

describe parser do
  let(:output) { parser.parse }

  it 'has a title and no errors' do
    expect(output.stderr_lines).to be_empty
    expect(output.exitstatus).to be(0)
    expect(output.title).to eql('£')
  end

  context 'Finance' do
    pending 'Not implemented yet.'
  end

  context 'TopTal' do
    context 'when working' do
      let(:output) { parser.parse('START_OF_THE_ENGAGEMENT' => '2017-01-01') }

      it 'shows TopTal related info' do
        expect(output.lines.grep(/toptal/i)).not_to be_empty
        # TODO: days worked, days off, total $.
      end
    end

    context 'when not working' do
      let(:output) { parser.parse('START_OF_THE_ENGAGEMENT' => '') }

      it 'shows no TopTal related info' do
        expect(output.lines.grep(/toptal/i)).to be_empty
      end
    end
  end

  context 'time zones' do
    it 'shows the current timezone' do
      timezone = Time.now.strftime('%Z')
      expect(output.lines.grep(/Current timezone: #{timezone} -?\d/)).not_to be_empty
    end

    it 'shows other time zones' do
      parser.parse('TIMEZONES' => 'Europe/Prague')
      expect(output.lines.grep(/\d{2}:\d{2} Prague/)).not_to be_empty
    end
  end
end
