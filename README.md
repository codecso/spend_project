# Solo Project: Spend
- Time Allowance: 7th December, 2018 - 12th December, 2018

## Table
- Running Application
- MVP (Original)
- Extensions (Original)
- Incomplete Originals
- Status
- Tech Stack

## Running Application
- cd into spend_app and open up multiple tabs for the respective commands.
1. createdb spend
2. psql -d spend -f db/spend.sql
3. ruby db/seeds.rb
4. ruby app.rb
5. Open up in your browser: http://localhost:4567

## MVP (Original)
- The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail. ✓
- The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport. ✓
- The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction. ✓
- The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions. ✓

## Extensions (Original)
- Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place. ✓
- The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries. ✓

## Status
- Project Complete

## Tech Stack
- Ruby, Sinatra, PostgreSQL, HTML5 and CSS3
