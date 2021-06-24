defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Logic exercise representation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :training_id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Exercise's name"
    field :youtube_video_url, non_null(:string), description: "Exercise's video demo"
    field :protocol_description, non_null(:string), description: "Exercise's protocol description"
    field :repetitions, non_null(:string), description: "Exercise's repetition pattern"
  end
end
