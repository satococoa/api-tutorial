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
  end
end
