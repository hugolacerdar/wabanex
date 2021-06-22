defmodule Wabanex.Users.Get do
  alias Wabanex.{Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
