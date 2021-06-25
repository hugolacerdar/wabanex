defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert response == %{"Ay" => 25.53544639152223, "Hugo" => 27.26530612244898, "J" => 20.140804180577735}
    end

    test "when params are invalid, returns an error", %{conn: conn} do
      params = %{"filename" => "invalid"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert response ==  "Error while opening the file"
    end
  end
end
