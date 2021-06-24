defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_keys [:name, :youtube_video_url, :protocol_description, :repetitions]

  schema "exercises" do
    field :name, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
    field :repetitions, :string

    belongs_to(:training, Training)

    timestamps()
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @required_keys)
    |> validate_required(@required_keys)
  end
end
