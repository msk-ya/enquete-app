require "application_system_test_case"

class EnquetesTest < ApplicationSystemTestCase
  setup do
    @enquete = enquetes(:one)
  end

  test "visiting the index" do
    visit enquetes_url
    assert_selector "h1", text: "Enquetes"
  end

  test "creating a Enquete" do
    visit enquetes_url
    click_on "New Enquete"

    fill_in "Content", with: @enquete.content
    fill_in "Title", with: @enquete.title
    click_on "Create Enquete"

    assert_text "Enquete was successfully created"
    click_on "Back"
  end

  test "updating a Enquete" do
    visit enquetes_url
    click_on "Edit", match: :first

    fill_in "Content", with: @enquete.content
    fill_in "Title", with: @enquete.title
    click_on "Update Enquete"

    assert_text "Enquete was successfully updated"
    click_on "Back"
  end

  test "destroying a Enquete" do
    visit enquetes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enquete was successfully destroyed"
  end
end
