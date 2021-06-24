defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_keys [:email, :name, :password]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    has_one(:training, Training)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_keys)
    |> validate_required(@required_keys)
    |> validate_length(:name, min: 2, max: 30)
    |> validate_length(:password, min: 8, max: 30)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
