require 'rails_helper'

RSpec.describe "Enquetes", type: :system do
  before do
    @user = User.create(
      name: "山田　花子",
      email: "yamada@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end
  #**********************************************************
  describe "ホーム画面からログイン後管理画面へ" do
    it '管理画面移動成功' do
      visit root_path
      find(".login-a").click
      fill_in "user[email]",	with: "yamada@example.com" 
      fill_in "user[password]",	with: "password" 
      click_on "ログインする"
      click_on "アンケート管理"
      expect(page).to  have_content "アンケート一覧"
    end
  end
  #**********************************************************
  describe "新規アンケート" do
    it "登録失敗" do
      visit root_path
      find(".login-a").click
      fill_in "user[email]",	with: "yamada@example.com" 
      fill_in "user[password]",	with: "password" 
      click_on "ログインする"
      click_on "アンケート管理"
      find(".new-enquete-link").click
      expect(page).to  have_content "新規アンケート作成"
      fill_in "enquete[title]",	with: "" 
      fill_in "enquete[content]",	with: "" 
      click_on "追加"
      expect(page).to have_content "タイトルを入力してください" 
      expect(page).to have_content "概要を入力してください" 
    end
  end
  #************************************************************
  describe "登録処理" do
    it "登録成功" do
      visit root_path
      find(".login-a").click
      fill_in "user[email]",	with: "yamada@example.com" 
      fill_in "user[password]",	with: "password" 
      click_on "ログインする"
      click_on "アンケート管理"
      find(".new-enquete-link").click
      expect(page).to  have_content "新規アンケート作成"
      fill_in "enquete[title]",	with: "お店について" 
      fill_in "enquete[title]",	with: "2021-12-31" 
      fill_in "enquete[content]",	with: "よく行くお店について質問です。" 
      find("option[value='甲府市']").select_option
      click_on "追加"
      expect(page).to  have_content "アンケート質問登録"
    end
  end
  #************************************************************
  

end
