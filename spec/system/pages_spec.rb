require 'rails_helper'

RSpec.describe "Pages", type: :system do
  #****************top*************************
  before do
    @user = User.create(
      name: "渡辺　次郎",
      email: "watanabe@example.com",
      password: "password",
      password_confirmation: "password"
    )
    @enquete= Enquete.create(
     title: "休暇について",
     content: "休暇についてのアンケート",
     limit: Date.parse("2021-12-31"),
     area: "甲府市",
     user_id: @user.id
    )
    @enquete2= Enquete.create(
     title: "調査",
     content: "空き家の調査です",
     limit: Date.parse("2020-12-31"),
     area: "大月市",
     user_id: @user.id
    )
  end

  describe "トップページ" do
    it 'トップページが無事表示されている' do
      visit root_path
      expect(page).to have_content "山梨県の様々な出来事のアンケート掲示板"
    end

    it 'アンケート参加ボタンによる画面遷移' do
      visit root_path
      click_on 'アンケートに参加する'
       expect(page).to have_content "アンケート一覧" 
    end

    it 'ログインボタンによる画面遷移' do
      visit root_path
      find(".login-a").click
       expect(page).to have_content "ログイン" 
    end
  end
  #***************top  end **********************
  describe "アンケートページメインページ" do
    it 'アンケートの確認' do
      visit pages_path
      expect(page).to have_content "休暇について" 
      expect(page).to have_content "受付中" 
      expect(page).to have_content "終了"
    end
    
  end
  #*****************アンケートメインページend***************
  

end
