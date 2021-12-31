require 'rails_helper'

describe ResponseProcessor do
  context 'when no status_code passed' do
    subject { described_class.new({ website: create(:website) }) }
    it 'fails with exception' do
      expect { subject.call }.to raise_error(RuntimeError, 'Missing status_code!')
    end
  end

  context 'when no website passed' do
    subject { described_class.new(status_code: 200) }
    it 'fails with exception' do
      expect { subject.call }.to raise_error(RuntimeError, 'Missing website!')
    end
  end

  context 'when status_code 200' do
    subject { described_class.new(status_code: 200, website: create(:website)) }
    it "WebsiteVisit shouldn't be created" do
      before_count = WebsiteVisit.count
      subject.call
      after_count = WebsiteVisit.count
      expect(before_count).to eq after_count
    end
  end

  context 'when error status_code and no previous visit' do
    subject { described_class.new(status_code: 404, website: create(:website)) }
    it 'WebsiteVisit should be created' do
      before_count = WebsiteVisit.count
      subject.call
      after_count = WebsiteVisit.count
      expect(after_count - before_count).to eq 1
    end
  end

  context 'when error status_code with previous visit less than min interval' do
    subject! do
      website = create(:website,
                       min_interval: 5)
      create(:website_visit, website: website, created_at: Time.now - 2.minutes)
      described_class.new(status_code: 404, website: website)
    end
    it "WebsiteVisit shouldn't be created" do
      before_count = WebsiteVisit.count
      subject.call
      after_count = WebsiteVisit.count
      expect(before_count).to eq after_count
    end
  end

  context 'when error status_code with previous visit more than min interval' do
    subject! do
      website = create(:website,
                       min_interval: 5)
      create(:website_visit, website: website, created_at: Time.now - 7.minutes)
      described_class.new(status_code: 404, website: website)
    end
    it 'WebsiteVisit should be created' do
      before_count = WebsiteVisit.count
      subject.call
      after_count = WebsiteVisit.count
      expect(after_count - before_count).to eq 1
    end
  end
end
