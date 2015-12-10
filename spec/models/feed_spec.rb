require 'spec_helper'

describe 'Feed' do
  it 'validates url format' do
    invalid_feed = Feed.new(url: 'not a url', title: 'fake feed')
    valid_feed = Feed.new(url: 'http://the-toast.net/feed/', title: 'The Toast')
    expect(invalid_feed).to be_invalid
    expect(valid_feed).to be_valid
  end
end