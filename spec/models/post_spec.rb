require 'spec_helper'

describe Post do
   describe 'validations' do

    it 'is valid' do
      expect(build(:post)).to be_valid
    end

    it 'should have a published datetime' do
      expect(build(:post, published: nil)).to be_invalid
    end

    it 'has a feed_id' do
      expect(build(:post, feed_id: nil)).to be_invalid
    end
  end

  describe 
end
