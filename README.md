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

      <% @available_flights.each do |flight| %>
        <li class="px-6 py-2 border-b border-gray-200 w-full">
          Departing from <%= flight.departure_airport.name %> to <%= flight.arrival_airport.name %> at <%= flight.takeoff %>
        </li>
      <% end %>

  <div class="basis-2/3 flex justify-center">
    <ul class="bg-white rounded-lg border border-gray-200 w-96 text-gray-900">
      <% form_with(model: @available_flights, url: "", method: :get) do |form| %>
        <li class="px-6 py-2 border-b border-gray-200 w-full">
          <%= form.collection_radio_buttons(:ids, 
                                            @available_flights, 
                                            :id, 
                                            :quick_flight_info) %>
        </li>                                    
      <% end %>
    </ul>
  </div>


  <div class="basis-2/3 flex justify-center">
    <ul class="bg-white rounded-lg border border-gray-200 w-96 text-gray-900">
        <li class="px-6 py-2 border-b border-gray-200 w-full">
          <%= collection_radio_buttons(:available_flights, :ids, 
                                            @available_flights, 
                                            :id, 
                                            :quick_flight_info) %>
        </li>                                    
    </ul>
  </div>

  @available_flights = Flight.where("departure_airport_id = :departure_id AND arrival_airport_id = :arrival_id AND departure_date = :date",
                                      {departure_id: params[:departure_id], arrival_id: params[:arrival_id], date: params[:date]}).first(2)

  @available_flights = Flight.where("departure_airport_id = :departure_id AND arrival_airport_id = :arrival_id AND departure_date = :date",
                                      {departure_id: params[:departure_id], arrival_id: params[:arrival_id], date: params[:date]})

        <% form_with(url: "", method: :get) do |form| %>
        <% @available_flights.each do |flight| %>
          <%= form.radio_button :flight_option, flight.map(&:id), { required: true } %>
          <%= form.label :flight_option, "Just anything" %>
        <% end %>
      <% end %>

      <% @available_flights.each do |flight| %>
        <%= flight.class %>
      <% end %>
    
<div class="basis-2/3 flex justify-center">
    <ul class="bg-white rounded-lg border border-gray-200 w-96 text-gray-900">
      <% form_with url: "", method: "get" do |form| %>
        <% @available_flights.each do |flight| %>
          <%= form.radio_button :flight_option, flight.id, { required: true } %>
          <%= form.label :flight_option, "Just anything" %>
        <% end %>
        <%= form.submit "Book Flight" %>
      <% end %>
    </ul>
  </div>
</div>