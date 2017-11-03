require "rails_helper"

describe "the filtering process", type: :feature, js: true do
  let!(:category){ create(:category, name: "Carros") }
  let!(:transaktion){ create(:transaktion, name: "Retiro") }
  let!(:expenses){ create_list(:expense, 10) }
  let!(:expense){ create(:expense, category_id: category.id, transaktion_id: transaktion.id) }
  let!(:expense_last_month){ create(:expense, date_transaction: Date.current - 1.month) }

  it "show the expenses of current month" do
    visit '/expenses'

    expect(page).to have_css("tbody#expenses tr", count: 11)
  end

  it "show the expenses of last month" do
    visit '/expenses'

    page.select (Date.current - 1.month).strftime("%b %Y"), from: 'filter_date'
    expect(page).to have_css("tbody#expenses tr", count: 1)
  end

  it "show the expenses of 'carros' category" do
    visit '/expenses'

    click_link "Carros"
    expect(page).to have_css("tbody#expenses tr", count: 1)
  end

  it "show the expenses of 'Retiro' transaktion" do
    visit '/expenses'

    click_link "Retiro"
    expect(page).to have_css("tbody#expenses tr", count: 1)
  end
end
