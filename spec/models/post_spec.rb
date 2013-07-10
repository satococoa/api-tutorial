require 'spec_helper'

describe Post do
  describe '#valid?' do
    context '全ての属性が正しいとき' do
      subject(:post) { FactoryGirl.build(:post) }
      specify { expect(post).to be_valid }
    end

    context 'nameが空のとき' do
      subject(:post) { FactoryGirl.build(:post, name: '') }
      specify { expect(post).not_to be_valid }
    end

    context 'nameが2文字のとき' do
      subject(:post) { FactoryGirl.build(:post, name: 'ab') }
      specify { expect(post).not_to be_valid }
    end

    context 'nameが101文字のとき' do
      subject(:post) { FactoryGirl.build(:post, name: 'a' * 101) }
      specify { expect(post).not_to be_valid }
    end

    context 'titleが空のとき' do
      subject(:post) { FactoryGirl.build(:post, title: '') }
      specify { expect(post).not_to be_valid }
    end

    context 'titleが2文字のとき' do
      subject(:post) { FactoryGirl.build(:post, title: 'ab') }
      specify { expect(post).not_to be_valid }
    end

    context 'titleが101文字のとき' do
      subject(:post) { FactoryGirl.build(:post, title: 'a' * 101) }
      specify { expect(post).not_to be_valid }
    end

    context 'bodyが空のとき' do
      subject(:post) { FactoryGirl.build(:post, body: '') }
      specify { expect(post).not_to be_valid }
    end
  end
end
