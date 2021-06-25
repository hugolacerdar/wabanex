defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true
  alias Wabanex.User
  alias Ecto.Changeset

  describe "changeset/1" do
    test "given valid params, returns a valid changeset" do
      params = %{"email" => "student@stu.com", "name" => "Student", "password" => "12345678"}

      response = User.changeset(params)

      assert %Changeset{action: nil, changes: %{email: "student@stu.com", name: "Student", password: "12345678"}, errors: [], data: %User{}, valid?: true} = response
    end

    test "given any invalid params, returns a invalid changeset" do
      params = %{"email" => "studentstu.com", "name" => "Student", "password" => "12345678"}

      response = User.changeset(params)

      assert response.valid? == :false
      assert errors_on(response) == %{email: ["has invalid format"]}
    end
  end
end
