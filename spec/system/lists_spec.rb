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
        context '投稿処理のテスト' do
            it '投稿後のリダイレクト先は正しいか' do
                fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
                fill_in 'list[body]', with: Faker::Lorem.characters(number:10)
                attach_file 'list[image]', File.join(Rails.root, 'spec/fixtures/sample_s.jpg')
                click_button '投稿'
                expect(page).to have_current_path list_path(List.last)
            end
        end
    end
    describe '一覧画面のテスト' do
        # テスト前に毎回一覧画面に遷移
        before do
            visit lists_path
        end
        context '一覧の表示とリンクの確認' do
            it "一覧表示画面に投稿されたものが表示されているか" do
                expect(page).to have_content list.title
                expect(page).to have_link list.title
            end
        end
    end
    describe '詳細画面のテスト' do
        # テスト前に毎回詳細画面に遷移
        before do
            visit list_path(list)
        end
        context '表示の確認' do
            it '削除リンクが存在しているか' do
                expect(page).to have_content '削除'
                expect(page).to have_link "削除", href: list_path(list)
            end
            it '編集リンクが存在しているか' do
                expect(page).to have_content '編集'
                expect(page).to have_link "編集", href:  edit_list_path(list)
            end
        end
        context 'リンクの遷移先の確認' do
            it '編集の遷移先は編集画面か' do
                show_link = find_all('a')[3]
                show_link.click
                expect(current_path).to eq('/lists/'+list.id.to_s+'/edit')
            end
        end
        context 'list削除のテスト' do
            it 'listの削除' do
                show_link = find_all('a')[4]
                expect{show_link.click}.to change{List.count}.by(-1)
            end
        end
    end
    describe '編集画面のテスト' do
        # テスト前に毎回編集画面に遷移
        before do
            visit edit_list_path(list)
        end
        context '表示の確認' do
            it '編集前のタイトルと本文、画像がフォームに表示(セット)されている' do
                expect(page).to have_field 'list[title]', with: list.title
                expect(page).to have_field 'list[body]', with: list.body
            end
            it '保存ボタンが表示される' do
                expect(page).to have_button '保存'
            end
        end
        context '更新処理に関するテスト' do
            it '更新後のリダイレクト先は正しいか' do
                fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
                fill_in 'list[body]', with: Faker::Lorem.characters(number:10)
                click_button '保存'
                expect(current_path).to eq('/lists/'+list.id.to_s)
            end
        end
    end
    
end