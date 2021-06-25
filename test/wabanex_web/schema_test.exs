defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create, as: UserCreate

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "hugo@mail.com", name: "Hugo", password: "12345678"}

      {:ok, %User{id: user_id}} = UserCreate.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            id
            name
            email
          }
        }
      """

      response = conn
      |> post("/api/graphql", %{query: query})
      |> json_response(:ok)

      assert response == %{"data" => %{"getUser" => %{"email" => "hugo@mail.com", "id" => user_id, "name" => "Hugo"}}}
    end
  end

  describe "users mutations" do
    test "when valid params are given, creates a user", %{conn: conn} do
      params = %{email: "abacate@mail.com", name: "Abacate", password: "12345678"}

      mutation = """
        mutation {
          createUser(input: {
            name: "#{params.name}",
            email: "#{params.email}",
            password: "#{params.password}",
          }){
            name
            email
          }
        }
      """

      response = conn
      |> post("/api/graphql", %{query: mutation})
      |> json_response(:ok)

      assert response ==  %{"data" => %{"createUser" => %{"email" => "abacate@mail.com", "name" => "Abacate"}}}
    end
  end
end
