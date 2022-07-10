# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

    @available_flights = Flight.where("departure_airport_id = :departure_id AND arrival_airport_id = :arrival_id AND departure_date = :date",
                                      {departure_id: params[:departure_id], arrival_id: params[:arrival_id], date: params[:date]})