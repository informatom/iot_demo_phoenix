defmodule WeatherTrackerWeb.WeatherConditionsController do
  use WeatherTrackerWeb, :controller

  require Logger

  alias WeatherTracker.{
    WeatherConditions,
    WeatherConditions.WeatherCondition
  }

  def create(conn, params) do
    IO.inspect(params)

    token =
      get_req_header(conn, "authorization")
      |> List.first()

    if token == "shiqbNfVhL91JZOtqK0896BYJfZbUDrI2ERIzmoc" do
      case WeatherConditions.create_entry(params) do
        {:ok, weather_condition = %WeatherCondition{}} ->
          Logger.debug("Successfully created a weather condition entry")

          conn
          |> put_status(:created)
          |> json(weather_condition)

        error ->
          Logger.warn("Failed to create a weather entry: #{inspect(error)}")

          conn
          |> put_status(:unprocessable_entity)
          |> json(%{message: "Poorly formatted payload"})
      end
    else
      Logger.warn("No valid auth token provided")

      conn
      |> put_status(:unprocessable_entity)
      |> json(%{message: "Auth token not valid"})
    end
  end
end
