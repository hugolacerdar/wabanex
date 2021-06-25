defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true
  alias Wabanex.IMC
  describe "calculate/1" do
    test "given a valid filename, returns the calculated data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      assert response == {:ok, %{"Ay" => 25.53544639152223, "Hugo" => 27.26530612244898, "J" => 20.140804180577735}}
    end
    test "given an invalid filename, returns an error" do
      params = %{"filename" => "invalid"}

      response = IMC.calculate(params)

      assert response == {:error, "Error while opening the file"}
    end
  end
end
