require 'spec_helper'

describe Post do
  let(:post) { Post.new( author: "Davida", type: "Feeder", content: "This is my content", published: Time.now) }
  describe 'validations' do

    it 'is valid' do
      expect(post).to be_valid
    end

    it 'should have an author' do
      post.author = nil
      expect(post).to be_invalid
    end

    it 'should have a type' do
      post.type = nil
      expect(post).to be_invalid
    end

    it 'should have content' do
      post.content = nil
      expect(post).to be_invalid
    end

    it 'should have a published datetime' do
      post.published = nil
      expect(post).to be_invalid
    end
  end
end
