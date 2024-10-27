# frozen_string_literal: true

require 'rails_helper'
describe '投稿のテスト' do
    let!(:list) {create(:list, title:'hoge', body:'hoge')}
    describe 'トップ画面(top_path)のテスト' do
        # テスト前に毎回トップ画面に遷移
        before do
            visit top_path
        end
        context '表示の確認' do
            it 'トップ画面(top_path)に「ここはTopページです」が表示されているか' do
                expect(page).to have_content "ここはTopページです"
            end
            it 'top_pathが"/top"であるか' do
                expect(current_path).to eq('/top')
            end
        end
    end
    describe '投稿画面のテスト' do
        # テスト前に毎回投稿画面に遷移
        before do
            visit new_list_path
        end
        context '表示の確認' do
            it 'new_lists_pathが"/lists_new"であるか' do
                expect(current_path).to eq('/lists/new')
            end
            it '投稿ボタンが表示されているか' do
                expect(page).to have_button "投稿"
            end
        end
    end
    
end