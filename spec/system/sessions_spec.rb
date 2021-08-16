require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  before do
    @user = User.create(
      name: "渡辺　次郎",
      email: "watanabe@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end
  #********************************************
  describe "ログイン機能" do
    it 'ページが無事表示されている。' do
      visit new_user_session_path
      expect(page).to have_content "新規登録はこちらへ" 
    end
    it "ログイン成功する" do
      visit new_user_session_path
      fill_in "user[email]",	with: "watanabe@example.com" 
      fill_in "user[password]",	with: "password"
      click_on "ログインする"
       expect(page).to have_content "渡辺　次郎" 
    end
  end
   #********************************************
   describe "新規会員登録" do
     it "新規会員登録失敗（名前未入力)" do
       visit new_user_registration_path
       fill_in "user[name]",	with: ""
       fill_in "user[email]",	with: "ueno@example.com" 
       fill_in "user[password]",	with: "password"
       fill_in "user[password_confirmation]",	with: "password" 
       click_on "登録"
       expect(page).to have_content "名前を入力してください" 
     end

     it "新規会員登録失敗（パスワード６文字以下)" do
       visit new_user_registration_path
       fill_in "user[name]",	with: "上野　三郎"
       fill_in "user[email]",	with: "ueno@example.com" 
       fill_in "user[password]",	with: "pass"
       fill_in "user[password_confirmation]",	with: "pass" 
       click_on "登録"
       expect(page).to have_content "パスワードは6文字以上で入力してください" 
     end

     it "新規会員登録失敗（パスワード不一致)" do
       visit new_user_registration_path
       fill_in "user[name]",	with: "上野　三郎"
       fill_in "user[email]",	with: "ueno@example.com" 
       fill_in "user[password]",	with: "password"
       fill_in "user[password_confirmation]",	with: "123456" 
       click_on "登録"
       expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません" 
     end

     it "新規会員登録成功" do
       visit new_user_registration_path
       fill_in "user[name]",	with: "上野　三郎"
       fill_in "user[email]",	with: "ueno@example.com" 
       fill_in "user[password]",	with: "password"
       fill_in "user[password_confirmation]",	with: "password" 
       click_on "登録"
       expect(page).to have_content "上野　三郎" 
       expect(page).to have_content "アンケート管理" 
     end
     
   end
   

  

  
end
