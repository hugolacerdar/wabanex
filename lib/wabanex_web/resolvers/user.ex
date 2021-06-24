defmodule WabanexWeb.Resolvers.User do

  alias Wabanex.Users.Get
  alias Wabanex.Users.Create

  def get(%{id: user_id}, _context), do: Get.by_id(user_id)
  def create(%{input: params}, _context), do: Create.call(params)
end
