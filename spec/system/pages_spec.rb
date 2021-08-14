require 'rails_helper'

RSpec.describe "Pages", type: :system do
  #****************top*************************
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
  

end
