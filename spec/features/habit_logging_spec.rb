require 'rails_helper'

feature "Habit Logging", :type => :feature do
  scenario "User logs success and failure for a daily habit" do
    # OK, so, a user has an active habit.
    habit = Habit.create({
      habit_name: "Run",
      user_name: "Alice",
      email: "alice@example.com",
      active: true,
      confirmed: true
    })

    # On September 01, they log a success for that day...
    entry = habit.entries.create(for_date: Date.new(2016, 9, 1))
    visit log_success_for_entry_url(entry)

    # ...which takes them to the habit calendar page...
    expect(page).to have_text "Run"

    # ...where they see that the square for Sep. 01 is a success.
    sep01 = page.all('.calendar-entry')[0]
    expect(sep01).to have_text "September 1"
    expect(sep01[:class]).to match 'success'

    # The following day, September 02, the user logs a failure.
    entry = habit.entries.create(for_date: Date.new(2016, 9, 2))
    visit log_failure_for_entry_url(entry)

    # They're taken to the habit calendar page...
    expect(page).to have_text "Run"

    # ...where they see a failure square for Sep. 02.
    sep02 = page.all('.calendar-entry')[1]
    expect(sep02).to have_text "September 2"
    expect(sep02[:class]).to match 'failure'
  end
end
