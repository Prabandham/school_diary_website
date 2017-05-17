use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :school_diary, SchoolDiary.Endpoint,
  secret_key_base: "LW/umaAV2eANN9Ni6BN2QcV9ySLMp18ylvFsj3GZruWlLlK/OZAJ1DREHLE2uKDD"

# Configure your database
config :school_diary, SchoolDiary.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "school_diary_prod",
  pool_size: 20
