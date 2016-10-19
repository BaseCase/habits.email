require 'rails_helper'

feature "Habit Creation", :type => :feature do
  include ActiveJob::TestHelper

  scenario "User starts a new Habit" do
    # OK, so, a user visits the homepage...
    visit "/"
    expect(page).to have_text "Blep!"
    expect(Habit.count).to eq 0

    # ...and fills out the New Habit form.
    fill_in 'Habit Name', :with => "Run Every Day"
    fill_in 'Email',      :with => "alice@example.com"
    fill_in 'Your Name',  :with => "Alice"
    perform_enqueued_jobs { click_button 'Submit' }

    # We create the new Habit record in the db...
    expect(Habit.count).to eq 1
    expect(Habit.last.active).to be false

    # ...and send the user a confirmation email...
    email = ActionMailer::Base.deliveries[0]
    expect(email.subject).to eq "Confirm your new daily habit"
    expect(email.to).to include "alice@example.com"
    expect(email.body.encoded).to match "Hi, Alice!"
    expect(email.body.encoded).to match "Run Every Day"

    # ...and the user is redirected to the creation success page.
    expect(page).to have_text "Congrats on starting your new habit, Alice!"

    # When the user clicks the confirmation link in the email...
    confirmation_link = email.body.encoded.match(/<a id="confirm-link" href="(.*?)"/)[1]
    visit confirmation_link

    # ...then we set their habit to active...
    expect(Habit.last.active).to be true

    # ...and show the user the empty calendar page.
    expect(page).to have_text "You'll receive your first email later today"

    # Hooray! A new Habit has been started!
  end
end
