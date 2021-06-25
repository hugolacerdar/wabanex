defmodule Wabanex.Users.Get do
  import Ecto.Query
  alias Wabanex.{Repo, Training, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    query = from t in Training,
            where: ^today >= t.start_date
                    and ^today <= t.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
