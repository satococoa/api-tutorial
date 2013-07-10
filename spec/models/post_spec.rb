# coding: utf-8
require 'spec_helper'

describe Post do
  describe '#valid?' do
    it '全属性が正しい場合はtrue' do
      post = Post.new(name: 'foo', title: 'bar', body: 'bazbazbazbaz')
      expect(post.valid?).to be_true
    end

    it 'nameが空の場合はfalse' do
      post = Post.new(name: '', title: 'bar', body: 'bazbazbazbaz')
      expect(post.valid?).not_to be_true
    end

  end
end
