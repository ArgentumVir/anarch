defmodule Anarch.Repo do
  use Ecto.Repo,
    otp_app: :anarch,
    adapter: Ecto.Adapters.Postgres
end
