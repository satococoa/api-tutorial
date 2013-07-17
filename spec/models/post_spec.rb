# coding: utf-8
require 'spec_helper'

describe Post do
  describe '#valid?' do
    context '全属性が正しいとき' do
      subject(:post) { FactoryGirl.build(:post) }
      specify { expect(subject).to be_valid }
    end

    context 'nameが空のとき' do
      subject(:post) { FactoryGirl.build(:post, name: '') }
      specify { expect(subject).not_to be_valid }
    end

    context 'titleが空のとき' do
      subject(:post) { FactoryGirl.build(:post, title: '') }
      specify { expect(subject).not_to be_valid }
    end

    it '全属性が正しい場合はtrue' do
      post = FactoryGirl.build(:post)
      expect(post).to be_valid
    end

    it 'nameが空の場合はfalse' do
      post = FactoryGirl.build(:post, name: '')
      expect(post).not_to be_valid
    end

    it 'titleが空の場合はfalse' do
      post = FactoryGirl.build(:post, title: '')
      expect(post).not_to be_valid
    end

    it 'nameが3文字未満のときはfalse' do
      post = FactoryGirl.build(:post, name: 'ab')
      expect(post).not_to be_valid
    end

    it 'nameが100文字より多いときはfalse' do
      post = FactoryGirl.build(:post, name: 'a' * 101)
      expect(post).not_to be_valid
    end

    it 'titleが3文字未満のときはfalse' do
      post = FactoryGirl.build(:post, title: 'ab')
      expect(post).not_to be_valid
    end

    it 'titleが100文字より多いときはfalse' do
      post = FactoryGirl.build(:post, title: 'a' * 101)
      expect(post).not_to be_valid
    end

  end
end
