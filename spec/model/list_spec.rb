# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, 'モデルのテスト', type: :model do
    describe '実際に保存してみる' do
        it "有効な投稿内容の場合は保存されるか" do
            expect(FactoryBot.build(:list)).to be_valid
        end
    end
    context "空白のバリデーションチェック" do
        it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
            list = List.new(title: '', body:'hoge')
            list.image.attach(io: File.open('spec/fixtures/sample_s.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
            expect(list).to be_invalid
            expect(list.errors[:title]).to include("can't be blank")
        end
        it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
            list = List.new(title: 'hoge', body:'')
            list.image.attach(io: File.open('spec/fixtures/sample_s.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
            expect(list).to be_invalid
            expect(list.errors[:body]).to include("can't be blank")
        end
        it "imageが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
            list = List.new(title: 'hoge', body:'hoge')
            expect(list).to be_invalid
            expect(list.errors[:image]).to include("can't be blank")
        end
    end
end