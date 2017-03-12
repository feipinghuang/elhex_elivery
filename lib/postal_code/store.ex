defmodule ElhexDelivery.PostalCode.Store do
  use GenServer
  alias ElhexDelivery.PostalCode.DataParser

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :postal_code_store)
  end

  def init(_) do
    {:ok, DataParser.parse_data}
  end

  def get_geolacation(postal_code) do
    GenServer.call(:postal_code_store, {:get_geolacation, postal_code})
  end

  # Callbacks

  def handle_call({:get_geolacation, postal_code}, _from, geolacation_data) do
    geolacation = Map.get(geolacation_data, postal_code)
    {:reply, geolacation, geolacation_data}
  end
end
